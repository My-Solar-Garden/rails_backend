class Api::V1::SensorsController < ApplicationController
  def index
    render json: SensorSerializer.new(Sensor.all)
  end

  def show
    render json: SensorSerializer.new(Sensor.find(params[:id]))
  end

  def create
    garden = Garden.find(sensor_params[:garden_id])
    render json: SensorSerializer.new(garden.sensors.create(sensor_params))
  end

  def update
    render json: SensorSerializer.new(Sensor.update(params[:id], sensor_params))
  end

  def delete
    Sensor.destroy(params[:id])
  end

  private

    def sensor_params
      params.permit(:min_threshold, :max_threshold, :sensor_type, :garden_id)
    end
end
