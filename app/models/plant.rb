class Plant < ApplicationRecord
  validates :image, :name, :species, :description, :light_requirements, :water_requirements, :when_to_plant, :harvest_time, :common_pests, presence: true
end
