require 'rails_helper'

RSpec.describe 'Carbon Facade' do
  it "returns a list of plant-carbon objects" do
    search = CarbonFacade.search('asparagus')
    expect(search).to be_an(Array)
    expect(search.first).to be_a(CarbonInfo)
  end

  it "returns empty array if search fails" do
    search = CarbonFacade.search('woiejlkd')
    expect(search).to be_a(Array)
    expect(search).to be_empty
  end
end
