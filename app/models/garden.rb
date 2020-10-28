class Garden < ApplicationRecord
  validates :latitude, :longitude, :name, presence: true

  has_many :user_gardens
  has_many :users, through: :user_gardens
end
