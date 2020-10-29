class Api::V1::GardenHealthsController < ApplicationController
  def index
    render json: GardenHealthSerializer.new(GardenHealth.all)
  end

  def show
    render json: GardenHealthSerializer.new(GardenHealth.find(params[:id]))
  end

  def create
    render json: GardenHealthSerializer.new(GardenHealth.create(garden_health_params))
  end

  def update
    render json: GardenHealthSerializer.new(GardenHealth.update(params[:id], garden_health_params))
  end

  def destroy
    GardenHealth.destroy(params[:id])
  end

  private

  def garden_health_params
    params.permit(:sensor_id, :reading_type, :reading, :time_of_reading)
  end
end
