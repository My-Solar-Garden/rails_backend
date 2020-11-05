require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'valdations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should have_many :garden_plants }
    it { should have_many(:gardens).through(:garden_plants) }
  end

  describe 'creation' do
    it 'can create a new plant' do
      Plant.create!(
        image: '1.jpg',
        name: 'Tomato',
        species: 'plantus tomatous',
        description: 'red',
        light_requirements: 'lots',
        water_requirements: 'also a lot',
        when_to_plant: 'fall',
        harvest_time: 'spring',
        common_pests: 'everything')

        expect(Plant.count).to eq(1)
    end
  end
end
