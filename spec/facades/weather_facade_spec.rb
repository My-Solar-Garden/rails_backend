require 'rails_helper'

RSpec.describe WeatherFacade do
  it "It returns forecast poro" do
    lat = 39.74
    lon = -104.98
    forecast = WeatherFacade.get_forecast(lat, lon)

    expect(forecast).to be_a(Weather)
    expect(forecast.temperature).to be_a(Numeric)
    expect(forecast.daily).to be_an(Array)
    expect(forecast.daily[0].description).to be_a(String)
    expect(forecast.daily[0].temperature).to be_a(Numeric)
    expect(forecast.daily[0].humidity).to be_a(Numeric)
  end
end 