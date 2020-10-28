class Garden < ApplicationRecord
  validates :latitude, :longitude, :name, presence: true
end
