class Api::V1::Gardens::SensorsController < ApplicationController
  def index
    render json: SensorSerializer.new(Sensor.where(garden_id: params[:garden_id]))
  end
end
