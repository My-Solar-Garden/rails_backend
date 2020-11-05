class WeatherFacade
  def self.get_forecast(lat, lon)
    weather = WeatherService.get_weather(lat, lon)
    Weather.new(weather)
  end
end
