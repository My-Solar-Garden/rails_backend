require 'rails_helper'

describe "Plant search" do
  it "can get list of plants with a search term" do
    create(:plant, name: "Tomato")
    create(:plant, name: "Green Tomato")
    create(:plant, name: "Onion")
    create(:plant, name: "Parsnips")
    create(:plant, name: "Celery")

    get '/api/v1/plants/search?name=TOM'
    expect(response).to be_successful

    plants_with_tom = JSON.parse(response.body, symbolize_names: true)
    expect(plants_with_tom).to be_a Hash

    search_results = plants_with_tom[:data]
    expect(search_results).to be_a Array
    expect(search_results.count).to eq(2)
    expect(search_results[0][:attributes][:name].downcase.include?("tom")).to eq(true)
    expect(search_results[1][:attributes][:name].downcase.include?("tom")).to eq(true)
  end
end