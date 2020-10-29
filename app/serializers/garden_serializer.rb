class GardenSerializer
  include FastJsonapi::ObjectSerializer
  attributes :latitude
  attributes :longitude
  attributes :name
end
