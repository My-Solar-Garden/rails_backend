class Api::V1::GardensController < ApplicationController
  def index
    return nil if Garden.all.empty?
    render json: GardenSerializer.new(Garden.all)
  end

  def show
    return nil if !Garden.exists?(params[:id])
    render json: GardenSerializer.new(Garden.find(params[:id]))
  end

  def create
    user = User.find(params[:user_id])
    new_garden = user.gardens.create(garden_params)
    if new_garden.save
      image = ImageFacade.new_image(new_garden.name)
      new_garden.image = image ? image : "/assets/default-garden-5bbbceb5c8def07b7a99e836154844af647a4598ec1250edaf878c68467caad9.png"
      new_garden.save
      render json: GardenSerializer.new(new_garden)
    else
      render json: {"error": "Could not save garden"}
    end
  end

  def update
    return nil if !Garden.exists?(params[:id])
    render json: GardenSerializer.new(Garden.update(params[:id], garden_params))
  end

  def destroy
    return nil if !Garden.exists?(params[:id])
    Garden.destroy(params[:id])
  end

  private
  def garden_params
    params.permit(:latitude, :longitude, :name, :private, :description)
  end
end
