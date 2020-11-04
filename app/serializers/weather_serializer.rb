class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :humidity, :temperature, :daily

  # attribute :daily do |object|

  # end
end
