class Weather
  attr_reader :id, :temperature, :humidity, :description, :daily
  def initialize(data)
    @id = nil
    @temperature = data[:current][:temp]
    @humidity = data[:current][:humidity]
    @description = data[:current][:weather][0][:description]
    @daily = seven_day_forecast(data[:daily])
  end

  def seven_day_forecast(data)
    data.map do |day|
      DailyForecast.new(day)
    end
  end
end