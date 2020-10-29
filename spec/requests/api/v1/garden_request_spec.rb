require 'rails_helper'

describe 'garden API' do
  describe 'happy paths' do
    it 'can return a list of gardens' do
      create_list(:garden, 10)
      get "/api/v1/gardens"
      expect(response).to be_successful

      gardens = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(gardens).to be_an(Array)
      expect(gardens.count).to eq(10)

      gardens.each do |garden|
        expect(garden).to have_key(:id)
        expect(garden[:id]).to be_a(String)

        expect(garden).to have_key(:type)
        expect(garden[:type]).to be_an(String)

        expect(garden).to have_key(:attributes)
        expect(garden[:attributes]).to be_a(Hash)

        expect(garden[:attributes]).to have_key(:latitude)
        expect(garden[:attributes][:latitude]).to be_an(Float)

        expect(garden[:attributes]).to have_key(:longitude)
        expect(garden[:attributes][:longitude]).to be_an(Float)

        expect(garden[:attributes]).to have_key(:name)
        expect(garden[:attributes][:name]).to be_an(String)
      end
    end

      it 'can return a garden by its id' do
        new_garden = create(:garden)
        get "/api/v1/gardens/#{new_garden.id}"
        expect(response).to be_successful

        garden = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(garden).to have_key(:id)
        expect(garden[:id]).to be_an(String)

        expect(garden).to have_key(:type)
        expect(garden[:type]).to be_an(String)

        expect(garden).to have_key(:attributes)
        expect(garden[:attributes]).to be_a(Hash)

        expect(garden[:attributes]).to have_key(:latitude)
        expect(garden[:attributes][:latitude]).to be_an(Float)

        expect(garden[:attributes]).to have_key(:longitude)
        expect(garden[:attributes][:longitude]).to be_an(Float)

        expect(garden[:attributes]).to have_key(:name)
        expect(garden[:attributes][:name]).to be_an(String)

        expect(garden[:attributes][:latitude]).to eq(new_garden.latitude)
        expect(garden[:attributes][:longitude]).to eq(new_garden.longitude)
        expect(garden[:attributes][:name]).to eq(new_garden.name)
      end

      it 'can create a new garden' do
        garden_params = {longitude: 100.5, latitude: 97.5, name: "Garden 1", description: "it's a garden, what else do you want to know?"}

        headers = {"CONTENT_TYPE" => "application/json"}
        post "/api/v1/gardens", headers: headers, params: JSON.generate(garden_params)

        garden = Garden.last

        expect(response).to be_successful
        expect(garden.longitude).to eq(garden_params[:longitude])
        expect(garden.latitude).to eq(garden_params[:latitude])
        expect(garden.name).to eq(garden_params[:name])
      end

      it 'can update an existing garden' do
        garden = create(:garden)
        garden_params = {longitude: 100.5, latitude: 97.5, name: "Other Name", description: "it's a garden yo"}

        headers = { 'CONTENT_TYPE' => 'application/json' }
        patch "/api/v1/gardens/#{garden.id}", headers: headers, params: JSON.generate(garden_params)
        expect(response).to be_successful
        updated_garden = Garden.find_by(id: garden.id)

        expect(garden.description).to eq(nil)
        expect(updated_garden.longitude).to_not eq(garden.longitude)
        expect(updated_garden.latitude).to_not eq(garden.latitude)
        expect(updated_garden.name).to_not eq(garden.name)

        expect(updated_garden.longitude).to eq(garden_params[:longitude])
        expect(updated_garden.latitude).to eq(garden_params[:latitude])
        expect(updated_garden.name).to eq(garden_params[:name])
        expect(updated_garden.description).to eq(garden_params[:description])
      end

      it 'can destroy a garden' do
        garden = create(:garden)

        expect(Garden.count).to eq(1)
        delete "/api/v1/gardens/#{garden.id}"
        expect(response).to be_successful
        expect(Garden.count).to eq(0)
        expect{Garden.find(garden.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
  end
end