require 'rails_helper'

RSpec.describe CarbonService do
  context "instance methods" do
    context "#plants_by_search" do
      it "returns carbon data for a specific plant" do
        search = CarbonService.search('asparagus')
        expect(search).to be_a(Hash)
        expect(search).to have_key(:data)
        expect(search[:data]).to be_an(Array)

        plant_data = search[:data][0]
        expect(plant_data).to have_key(:attributes)

        attr = plant_data[:attributes]
        expect(attr).to be_a(Hash)
        expect(attr).to have_key(:name)
        expect(attr[:name]).to be_a(String)
        expect(attr).to have_key(:latin)
        expect(attr[:latin]).to be_a(String)
        expect(attr).to have_key(:arith_mean)
        expect(attr[:arith_mean]).to be_a(Numeric)
        expect(attr).to have_key(:stderror)
        expect(attr[:stderror]).to be_a(Numeric)
        expect(attr).to have_key(:journals)
        expect(attr[:journals]).to be_a(String)
      end
    end
  end
end
