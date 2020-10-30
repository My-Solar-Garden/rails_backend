require 'rails_helper'

RSpec.describe Plant, type: :model do
  describe 'valdations' do
    it { should validate_presence_of :image }
    it { should validate_presence_of :name }
    it { should validate_presence_of :species }
    it { should validate_presence_of :description }
    it { should validate_presence_of :light_requirements }
    it { should validate_presence_of :water_requirements }
    it { should validate_presence_of :when_to_plant }
    it { should validate_presence_of :harvest_time }
    it { should validate_presence_of :common_pests }
  end

  describe 'relationships' do
    it { should have_many :garden_plants }
    it { should have_many(:gardens).through(:garden_plants) }
  end

  describe 'class methods' do
    it "can search by name" do 
      p1 = create(:plant, name: "Tomato")
      p2 = create(:plant, name: "Green Tomato")
      p3 = create(:plant, name: "Onion")
      p4 = create(:plant, name: "Parsnips")
      p5 = create(:plant, name: "Celery")
      expect(Plant.search('tom')).to eq([p1, p2])
    end
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
