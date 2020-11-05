class Plant < ApplicationRecord
  validates :name, :description, presence: true

  has_many :garden_plants, dependent: :destroy
  has_many :gardens, through: :garden_plants
end
