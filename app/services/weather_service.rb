class WeatherService
  def self.get_weather(lat, lon)
    response = conn.get('/api/v1/forecast') do |f|
      f.params[:lat] = lat
      f.params[:lon] = lon
    end
    json = JSON.parse(response.body, symbolize_names: :true)
  end 

  private
  def self.conn
    Faraday.new(url: 'https://weather-microservice-api.herokuapp.com/')
  end
end