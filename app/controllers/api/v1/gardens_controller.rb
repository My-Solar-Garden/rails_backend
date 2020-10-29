class Api::V1::GardensController < ApplicationController
  def index
    render json: GardenSerializer.new(Garden.all)
  end
end
