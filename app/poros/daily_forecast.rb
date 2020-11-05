class DailyForecast
  attr_reader :temperature, :humidity, :description, :date
  def initialize(data)
    @date = formatted_date(data[:dt])
    @temperature = data[:temp][:day]
    @humidity = data[:humidity]
    @description = data[:weather][0][:description]
  end

  def formatted_date(iso)
    Time.at(iso)
  end
end
