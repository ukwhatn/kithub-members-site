class EventsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_admin!, only: [:new, :create]

  def new
    @event = Event.new
    @time_frame_str = ""
    @event_tags_str = ""
  end

  def create
    @event = Event.new(event_params)
    @time_frame_str = params[:event][:time_frame_str]
    @event_tags_str = params[:event][:event_tags_str]

    if @time_frame_str.blank?
      @event.errors.add(:time_frame_str, 'を入力してください')
      render :new
      return
    end

    failed = false
    Event.transaction do
      if @event.save
        @time_frame_str.split("\n").each do |tf|
          unless /\A\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}\s-\s\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}\s-\s\d+/.match?(tf)
            @event.errors.add(:time_frame_str, 'の形式が不正です')
            failed = true
            raise ActiveRecord::Rollback
          end

          dates = tf.split(' - ')
          logger.info dates
          @event.event_time_frames.create!(start_at: dates[0].strip, end_at: dates[1].strip, capacity: dates[2].strip)
        end

        @event_tags_str.split(" ").each do |tag|
          @event.event_tags << EventTag.find_or_create_by!(name: tag)
        end

      else
        failed = true
      end
    end

    if failed
      render :new
      return
    end

    redirect_to members_my_page_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :description, :description_for_attendees)
  end
end
