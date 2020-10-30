class Plant < ApplicationRecord
  validates :image, :name, :species, :description, :light_requirements, :water_requirements, :when_to_plant, :harvest_time, :common_pests, presence: true

  has_many :garden_plants
  has_many :gardens, through: :garden_plants

  def self.search(search_term)
    self.where("lower(name) LIKE ?", "%" + search_term.downcase + "%")
  end
end
 
