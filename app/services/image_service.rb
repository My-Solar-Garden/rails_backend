class ImageService
  def self.new_image(name)
    get_parsed_json('/v1/search', name)
  end

  def self.get_parsed_json(url, name)
    response = conn.get('/v1/search') do |req|
      req.headers[:authorization] = ENV['PEXELS_API_KEY']
      req.params[:query] = name
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)[:photos]
    parsed_json.sample[:src][:tiny] unless parsed_json.empty?
  end

  private

  def self.conn
    Faraday.new('https://api.pexels.com')
  end
end
