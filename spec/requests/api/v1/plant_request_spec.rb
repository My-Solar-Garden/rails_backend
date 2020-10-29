require 'rails_helper'

describe 'plant API' do
  describe 'happy paths' do
    it 'can return a list of plants' do
      create_list(:plant, 10)
      get "/api/v1/plants"
      expect(response).to be_successful

      plants = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(plants).to be_an(Array)
      expect(plants.count).to eq(10)

      plants.each do |plant|
        expect(plant).to have_key(:id)
        expect(plant[:id]).to be_a(String)

        expect(plant).to have_key(:type)
        expect(plant[:type]).to be_an(String)

        expect(plant).to have_key(:attributes)
        expect(plant[:attributes]).to be_a(Hash)

        expect(plant[:attributes]).to have_key(:image)
        expect(plant[:attributes][:image]).to be_an(String)

        expect(plant[:attributes]).to have_key(:name)
        expect(plant[:attributes][:name]).to be_an(String)

        expect(plant[:attributes]).to have_key(:species)
        expect(plant[:attributes][:species]).to be_an(String)

        expect(plant[:attributes]).to have_key(:description)
        expect(plant[:attributes][:description]).to be_an(String)

        expect(plant[:attributes]).to have_key(:light_requirements)
        expect(plant[:attributes][:light_requirements]).to be_an(String)

        expect(plant[:attributes]).to have_key(:water_requirements)
        expect(plant[:attributes][:water_requirements]).to be_an(String)

        expect(plant[:attributes]).to have_key(:when_to_plant)
        expect(plant[:attributes][:when_to_plant]).to be_an(String)

        expect(plant[:attributes]).to have_key(:harvest_time)
        expect(plant[:attributes][:harvest_time]).to be_an(String)

        expect(plant[:attributes]).to have_key(:common_pests)
        expect(plant[:attributes][:common_pests]).to be_an(String)
      end
    end
  end
end
