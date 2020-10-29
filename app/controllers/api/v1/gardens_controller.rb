class Api::V1::GardensController < ApplicationController
  def index
    render json: GardenSerializer.new(Garden.all)
  end

  def show
    render json: GardenSerializer.new(Garden.find(params[:id]))
  end
end
