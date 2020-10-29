require 'rails_helper'

RSpec.describe 'GardenHealth API' do
  describe 'happy-paths' do
    it "sends a list of garden health records" do
      create_list(:garden_health, 5)

      get '/api/v1/garden_healths'

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      garden_healths = json[:data]

      expect(garden_healths).to be_an(Array)
      expect(garden_healths.size).to eq(5)

      garden_healths.each do |garden_health|
        gh_serializer_check(garden_health)
      end
    end

    it "can get one garden health record by its id" do
      id = create(:garden_health).id

      get "/api/v1/garden_healths/#{id}"

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      garden_health = json[:data]

      gh_serializer_check(garden_health)
    end

    def gh_serializer_check(garden_health)
      expect(garden_health).to have_key(:id)
      expect(garden_health[:id]).to be_a(String)
      expect(garden_health).to have_key(:type)
      expect(garden_health[:type]).to be_a(String)
      expect(garden_health).to have_key(:attributes)
      expect(garden_health[:attributes]).to be_a(Hash)
      expect(garden_health[:attributes]).to have_key(:id)
      expect(garden_health[:attributes][:id]).to be_an(Integer)
      expect(garden_health[:attributes]).to have_key(:reading_type)
      expect(garden_health[:attributes][:reading_type]).to be_a(String)
      expect(garden_health[:attributes]).to have_key(:reading)
      expect(garden_health[:attributes][:reading]).to be_a(Float)
      expect(garden_health[:attributes]).to have_key(:time_of_reading)
      expect(garden_health[:attributes][:time_of_reading]).to be_a(String)
    end
  end
end
