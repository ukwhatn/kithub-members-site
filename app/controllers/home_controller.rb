class HomeController < ApplicationController
  before_action :reset_callback_referer

  def index
    @data = session[:data] || 'no data'
  end
end
