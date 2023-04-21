class FacultiesController < ApplicationController
  def get_departments
    render json: Faculty.find(params[:id]).departments.pluck(:id, :name)
  end
end
