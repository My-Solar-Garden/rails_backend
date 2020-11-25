class Api::V1::CarbonController < ApplicationController
  def search
    results = CarbonFacade.search(params[:plant])
    render json: CarbonSerializer.new(results)
  end
end
