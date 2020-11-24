require 'rails_helper'

RSpec.describe 'Carbon Offset' do
  it "should give us a list of matching plants and their carbon information" do
    # https://plant-carbon-api.herokuapp.com/api/v1/search?q=okra
    # get '/api/v1/carbon_search?plant=asparagus'
    request_params = { plant: 'asparagus' }
    get api_v1_carbon_search_path, params: request_params

    expect(response).to have_http_status(:success)
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:data)
    data = data[:data]

    expect(data).to be_an(Array)
    expect(data.length).to eq(2)

    first_result = data[0]
    expect(first_result).to have_key(:attributes)

    attr = first_result[:attributes]
    expect(attr).to have_key(:name)
    expect(attr[:name]).to be_a(String)
    expect(attr[:name]).to eq('Asparagus officinalis')
    expect(attr).to have_key(:latin)
    expect(attr[:latin]).to be_a(String)
    expect(attr[:latin]).to eq('Asparagus, Garden')
    expect(attr).to have_key(:average_exchange_percentage)
    expect(attr[:average_exchange_percentage]).to be_a(Numeric)
    expect(attr[:average_exchange_percentage]).to eq(25.0)
    expect(attr).to have_key(:standard_deviation_error)
    expect(attr[:standard_deviation_error]).to be_a(Numeric)
    expect(attr[:standard_deviation_error]).to eq(0.0)
    expect(attr).to have_key(:research_journals)
    expect(attr[:research_journals]).to be_a(String)
    expect(attr[:research_journals]).to eq('http://www.co2science.org/data/plant_growth/photo/a/ref/asparaguso_ref.php')
  end

  it "should handle errors when no plant is found" do
    # get '/api/v1/carbon_search?plant=eowinlknd'
    request_params = { plant: 'eowinlknd' }
    get api_v1_carbon_search_path, params: request_params

    expect(response).to have_http_status(:success)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data).to have_key(:data)
    expect(data[:data]).to be_an(Array)
    expect(data[:data].length).to eq(0)
  end
end
