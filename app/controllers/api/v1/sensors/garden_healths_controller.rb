class Api::V1::Sensors::GardenHealthsController < ApplicationController
  def index
    render json: GardenHealthSerializer.new(GardenHealth.where(sensor_id: params[:sensor_id]).order(created_at: :desc))
  end

  def last
    render json: GardenHealthSerializer.new(GardenHealth.where(sensor_id: params[:sensor_id]).order(created_at: :desc).limit(1))
  end

  def last_five
    render json: GardenHealthSerializer.new(GardenHealth.where(sensor_id: params[:sensor_id]).order(created_at: :desc).limit(5))
  end
end
