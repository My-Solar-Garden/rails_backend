class Sensor < ApplicationRecord
  validates :min_threshold, :max_threshold, :sensor_type, :garden_id, presence: true
  validates :min_threshold, :max_threshold, numericality: true

  belongs_to :garden
  has_many :garden_healths

  enum sensor_type: %w(moisture light temperature)
end
