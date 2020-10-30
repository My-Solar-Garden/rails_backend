class Api::V1::Plants::SearchController < ApplicationController
  def index
    plants = Plant.search(params[:term])
    render json: PlantSerializer.new(plants)
  end
end