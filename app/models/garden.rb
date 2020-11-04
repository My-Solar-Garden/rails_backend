class Garden < ApplicationRecord
  validates :latitude, :longitude, :name, presence: true
  validates :private, inclusion: { in: [ true, false ] }

  has_many :user_gardens, dependent: :destroy
  has_many :users, through: :user_gardens
  has_many :sensors, dependent: :destroy
  has_many :garden_plants, dependent: :destroy
  has_many :plants, through: :garden_plants

  def add_plant(plant)
    GardenPlant.create!(garden: self, plant: plant, planted_date: Date.today)
  end

  def create_and_add_plant(plant_params)
    plant = Plant.new(plant_params)
    if plant.save
      GardenPlant.create!(garden: self, plant: plant, planted_date: Date.today)
    end
  end
end
