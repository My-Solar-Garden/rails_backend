require 'rails_helper'

RSpec.describe Garden, type: :model do
  describe 'valdations' do
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :user_gardens }
    it { should have_many(:users).through(:user_gardens) }
    it { should have_many :sensors }
    it { should have_many :garden_plants }
    it { should have_many(:plants).through(:garden_plants) }
  end

  describe 'creation' do
    it 'can make a new user' do
      Garden.create!(latitude: 1.5, longitude: 1.5, name: 'Garden 1')
      expect(Garden.count).to eq(1)
    end
  end
end