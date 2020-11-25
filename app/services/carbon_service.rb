class CarbonService
  def self.search(search_term)
    response = conn.get('/api/v1/search') do |f|
      f.params[:q] = search_term
    end

    result = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    # output = result[:data].map do |plant|
    #   attr = plant[:attributes]
    #   # {
    #   #   attributes: {
    #   #     name: attr[:name],
    #   #     latin: attr[:latin],
    #   #     average_exchange_percentage: attr[:arith_mean],
    #   #     standard_deviation_error: attr[:stderror],
    #   #     research_journals: attr[:journals]
    #   #   }
    #   # }
    # end
    # # require "pry"; binding.pry
    # output
    # json = JSON.parse(response.body, symbolize_names: true)
    # json = JSON.parse(output.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://plant-carbon-api.herokuapp.com')
  end
end
