# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    logger.info request.env['omniauth.auth']
  end

  def destroy
    redirect_to root_path
  end
end
