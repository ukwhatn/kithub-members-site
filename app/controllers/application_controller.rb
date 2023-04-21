class ApplicationController < ActionController::Base
  before_action :create_alerts

  protected

  def reset_callback_referer
    if session['auth'].present? && session['auth']['referer'].present?
      session['auth'].delete("referer")
    end
  end

  def create_alerts
    @alerts = []
  end
end
