class Api::V1::CarbonController < ApplicationController
  def search
    # https://plant-carbon-api.herokuapp.com/api/v1/search?q=okra
    conn = Faraday.new('https://plant-carbon-api.herokuapp.com')
    
    result = CarbonService.search(params[:plant])
    # result = conn.get('/api/v1/search') do |req|
    #   req.params[:q] = params[:plant]
    # end
    # result = JSON.parse(result.body, symbolize_names: true)
    #
    # output = result[:data].map do |plant|
    #   attr = plant[:attributes]
    #   {
    #     attributes: {
    #       name: attr[:name],
    #       latin: attr[:latin],
    #       average_exchange_percentage: attr[:arith_mean],
    #       standard_deviation_error: attr[:stderror],
    #       research_journals: attr[:journals]
    #     }
    #   }
    # end

    response = {
      data: output
    }

    render json: response
  end
end
