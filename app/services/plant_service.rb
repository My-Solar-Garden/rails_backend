class PlantService
  def self.all_plants
    to_json('/plants')
  end

  def self.search(search_term)
    to_json('/plants/search', { search_term: search_term })
  end

  def self.to_json(url, params = {})
    response = conn.get(url) do |f|
      f.params = params
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://plants-api-2006.herokuapp.com')
  end
end