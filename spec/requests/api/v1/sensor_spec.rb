require "rails_helper"

RSpec.describe "Sensors" do
  describe "CRUD Requests" do
    before :each do
      @user = create :user
      @garden = create(:garden)
      @user_garden = create(:user_garden, user_id: @user.id, garden_id: @garden.id)
      @moisture_sensor = create(:sensor, :moisture_sensor, garden_id: @garden.id)
      @light_sensor = create(:sensor, :light_sensor, garden_id: @garden.id)
    end

    it "can get all sensors for a garden" do
      get "/api/v1/users/#{@user.id}/gardens/#{@garden.id}/sensors"

      expect(response).to be_successful

     sensors = JSON.parse(response.body, symbolize_names: true)

     expect(sensors).to be_an(Hash)
     expect(sensors[:data]).to be_an(Array)
     expect(sensors[:data].count).to eq(2)
    end

    it "can get one sensor from a garden" do
      get "/api/v1/users/#{@user.id}/gardens/#{@garden.id}/sensors/#{@moisture_sensor.id}"

      expect(response).to be_successful

     sensors = JSON.parse(response.body, symbolize_names: true)

     expect(sensors).to be_an(Hash)
     expect(sensors[:data]).to be_an(Hash)
     expect(sensors[:data][:attributes][:sensor_type]).to eq("moisture")
    end

    it "can create a sensor for a garden" do
      sensor_params = {
                       min_threshold: 5,
                       max_threshold: 14,
                       sensor_type: 0,
                       garden_id: @garden.id
                     }
       headers = {"CONTENT_TYPE" => "application/json"}

       post "/api/v1/users/#{@user.id}/gardens/#{@garden.id}/sensors", headers: headers, params: JSON.generate(sensor_params)

       expect(response).to be_successful

       sensors = JSON.parse(response.body, symbolize_names: true)

       expect(sensors).to be_an(Hash)
       expect(sensors[:data]).to be_an(Hash)
       expect(sensors[:data][:attributes][:sensor_type]).to eq("moisture")
       expect(sensors[:data][:attributes][:min_threshold]).to eq(5)
       expect(sensors[:data][:attributes][:max_threshold]).to eq(14)
    end

    it "cannot create a sensor for a garden with a missing params" do
      expect(Sensor.count).to eq(2)

      sensor_params = {
                       min_threshold: 5,
                       max_threshold: 14,
                       garden_id: @garden.id
                     }
       headers = {"CONTENT_TYPE" => "application/json"}

       post "/api/v1/users/#{@user.id}/gardens/#{@garden.id}/sensors", headers: headers, params: JSON.generate(sensor_params)

       expect(Sensor.count).to eq(2)
    end

    it "can update one sensor from a garden" do
      sensor_params = {
                       min_threshold: 22653,
                       max_threshold: 4235,
                     }
       headers = {"CONTENT_TYPE" => "application/json"}

       patch "/api/v1/users/#{@user.id}/gardens/#{@garden.id}/sensors/#{@moisture_sensor.id}", headers: headers, params: JSON.generate(sensor_params)

       expect(response).to be_successful

       updated_sensor = JSON.parse(response.body, symbolize_names: true)

       expect(updated_sensor).to be_an(Hash)
       expect(updated_sensor[:data]).to be_an(Hash)
       expect(updated_sensor[:data][:id]).to eq(@moisture_sensor.id.to_s)
       expect(updated_sensor[:data][:attributes][:sensor_type]).to eq("moisture")
       expect(updated_sensor[:data][:attributes][:min_threshold]).to eq(22653)
       expect(updated_sensor[:data][:attributes][:max_threshold]).to eq(4235)
    end

    it "can destroy one sensor from a garden" do
      expect(Sensor.count).to eq(2)

      delete "/api/v1/users/#{@user.id}/gardens/#{@garden.id}/sensors/#{@moisture_sensor.id}"

      expect(response).to be_successful
      expect(Sensor.count).to eq(1)
    end
  end
end
