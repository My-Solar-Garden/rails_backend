class Api::V1::Plants::SearchController < ApplicationController
  def index
    # plants = Plant.where("lower(name) LIKE ?", "%" + params[:name].downcase + "%")
    plants = Plant.search(params[:name])
    render json: PlantSerializer.new(plants)
  end
end