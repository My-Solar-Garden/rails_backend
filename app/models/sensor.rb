class Sensor < ApplicationRecord
  validates :min_threshold, :max_threshold, presence: true

  belongs_to :garden

  enum sensor_type: %w(moisture light)
end
