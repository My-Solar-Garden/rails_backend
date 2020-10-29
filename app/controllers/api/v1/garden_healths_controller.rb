class Api::V1::GardenHealthsController < ApplicationController
  def index
    render json: GardenHealthSerializer.new(GardenHealth.all)
  end
end
