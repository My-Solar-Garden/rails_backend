class Api::V1::SensorsController < ApplicationController
  def index
    return nil if Sensor.all.empty?
    render json: SensorSerializer.new(Sensor.all)
  end

  def show
    return nil if !Sensor.exists?(params[:id])
    render json: SensorSerializer.new(Sensor.find(params[:id]))
  end

  def create
    new_sensor = Sensor.new(sensor_params)
    render json: SensorSerializer.new(new_sensor) if new_sensor.save
  end

  def update
    return nil if !Sensor.exists?(params[:id])
    render json: SensorSerializer.new(Sensor.update(params[:id], sensor_params))
  end

  def destroy
    return nil if !Sensor.exists?(params[:id])
    Sensor.destroy(params[:id])
  end

  private

    def sensor_params
      params.permit(:min_threshold, :max_threshold, :sensor_type, :garden_id)
    end
end
