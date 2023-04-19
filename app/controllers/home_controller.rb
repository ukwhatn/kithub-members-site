# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @data = session[:data] || 'no data'
  end
end
