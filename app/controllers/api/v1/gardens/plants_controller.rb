class Api::V1::Gardens::PlantsController < ApplicationController
  def create
    garden = Garden.find(params[:id])
    if Plant.exists?(params[:plant_id])
      garden.add_plant(Plant.find(params[:plant_id]))
    else
      garden.create_and_add_plant(params[:plant_id], plant_params)
    end
  end

  def index
    render json: PlantSerializer.new(Garden.find(params[:id]).plants)
  end

  private
  def plant_params
    params.permit(:image, :name, :species, :description, :light_requirements, :water_requirements, :when_to_plant, :harvest_time, :common_pests)
  end
end
