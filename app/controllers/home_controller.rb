class HomeController < ApplicationController
  include SessionsHelper
  before_action :reset_callback_referer

  def index
    if is_authenticated?
      redirect_to members_my_page_path
      return
    end
    @data = session[:data] || 'no data'
  end
end
