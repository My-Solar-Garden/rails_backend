require 'rails_helper'

RSpec.describe WeatherSerializer do
  it "Sends weather forcast data" do
    lat = 39.74
    lon = -104.98

    get "/api/v1/forecast?lat=#{lat}&lon=#{lon}"

    expect(response).to be_successful
    rsp = JSON.parse(response.body, symbolize_names: :true)
  end
end