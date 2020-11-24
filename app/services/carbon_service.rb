class CarbonService
  def self.search(search_term)
    response = conn.get('/api/v1/search') do |f|
      f.params[:q] = search_term
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://plant-carbon-api.herokuapp.com')
  end
end
