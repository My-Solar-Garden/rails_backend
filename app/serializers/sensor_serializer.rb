class SensorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :min_threshold, :max_threshold, :sensor_type
end
