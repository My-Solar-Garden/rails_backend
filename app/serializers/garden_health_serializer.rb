class GardenHealthSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :reading_type, :reading, :time_of_reading
end
