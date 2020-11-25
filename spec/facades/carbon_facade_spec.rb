require 'rails_helper'
RSpec.describe 'Carbon Facade' do
  it "returns a list of plant-carbon objects" do
    search = CarbonFacade.search('asparagus')
    expect(search).to be_a(Hash)
  end
end
