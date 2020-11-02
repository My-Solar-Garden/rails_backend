require 'rails_helper'

describe 'Gardens' do
  it "can add a plant if it doesn't exist in the database" do 
    garden = create(:garden)
    plant_params = { 
      image: 'image.url',
      name: 'plant name',
      species: 'plant species',
      description: 'plant description',
      light_requirements: 'light needed for plant',
      water_requirements: 'water needed for plant',
      when_to_plant: 'when to plant',
      harvest_time: 'time to harvest',
      common_pests: 'common pests for plant',
      plant_id: '12'
    }
    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/gardens/#{garden.id}/plants", headers: headers, params: JSON.generate(plant_params)

    plant = Plant.first

    expect(response).to be_successful
    expect(plant.image).to eq(plant_params[:image])
    expect(plant.name).to eq(plant_params[:name])
    expect(plant.species).to eq(plant_params[:species])
    expect(plant.description).to eq(plant_params[:description])
    expect(plant.light_requirements).to eq(plant_params[:light_requirements])
    expect(plant.water_requirements).to eq(plant_params[:water_requirements])
    expect(plant.when_to_plant).to eq(plant_params[:when_to_plant])
    expect(plant.harvest_time).to eq(plant_params[:harvest_time])
    expect(plant.common_pests).to eq(plant_params[:common_pests])
  end
end