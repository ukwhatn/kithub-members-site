class Event < ApplicationRecord
  has_many :event_time_frames, dependent: :destroy
  has_many :event_tag_joins, dependent: :destroy
  has_many :event_tags, through: :event_tag_joins

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :description_for_attendees, presence: true
end
