class Api::V1::GardenHealthsController < ApplicationController
  def index
    render json: GardenHealthSerializer.new(GardenHealth.all)
  end

  def show
    render json: GardenHealthSerializer.new(GardenHealth.find(params[:id]))
  end
end
