class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :humidity, :temperature, :daily
end
