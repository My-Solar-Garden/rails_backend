class Api::V1::PlantsController < ApplicationController
  def index
    render json: PlantSerializer.new(Plant.all)
  end
end
