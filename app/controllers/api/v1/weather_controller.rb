class Api::V1::WeatherController < ApplicationController

  def show

    @weather = WeatherFacade.get_forecast(params[:lat], params[:lon])
    render json: WeatherSerializer.new(@weather)
  end
  
end