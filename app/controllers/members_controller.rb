class MembersController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user!

  def index
    @user = current_user
    @members = User.all
  end

  def show

  end
end
