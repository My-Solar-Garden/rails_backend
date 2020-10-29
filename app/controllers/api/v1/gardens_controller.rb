class Api::V1::GardensController < ApplicationController
  def index
    render json: GardenSerializer.new(Garden.all)
  end

  def show
    render json: GardenSerializer.new(Garden.find(params[:id]))
  end

  def create
    new_garden = Garden.new(garden_params)
    render json: GardenSerializer.new(new_garden) if new_garden.save
  end

  private
  def garden_params
    params.permit(:latitude, :longitude, :name, :description)
  end
end
