class Garden < ApplicationRecord
  validates :latitude, :longitude, :name, presence: true
  validates :private, inclusion: { in: [ true, false ] }

  has_many :user_gardens
  has_many :users, through: :user_gardens
  has_many :sensors
  has_many :garden_plants
  has_many :plants, through: :garden_plants
end
