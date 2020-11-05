require 'rails_helper'

RSpec.describe "Weather Service" do
  it "Can return forecast data for a geolocation" do
    lat = 39.74
    lon = -104.98

    weather = WeatherService.get_weather(lat, lon)

    expect(weather).to be_a(Hash)
    expect(weather[:current]).to be_a(Hash)
    expect(weather[:daily]).to be_an(Array)
    expect(weather[:current][:humidity]).to be_a(Numeric)
    expect(weather[:current][:temp]).to be_a(Numeric)
    expect(weather[:current][:weather]).to be_an(Array)
    expect(weather[:current][:weather][0]).to be_a(Hash)
    expect(weather[:current][:weather][0][:description]).to be_a(String)

    expect(weather[:daily][0]).to be_a(Hash)
    expect(weather[:daily][0][:humidity]).to be_a(Numeric)
    expect(weather[:daily][0][:temp][:day]).to be_a(Numeric)
    expect(weather[:daily][0][:weather]).to be_an(Array)
    expect(weather[:daily][0][:weather][0]).to be_a(Hash)
    expect(weather[:daily][0][:weather][0][:description]).to be_a(String)
  end
end