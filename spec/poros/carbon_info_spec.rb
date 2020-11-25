require 'rails_helper'

RSpec.describe CarbonInfo do
  it "is building a carbon object" do
    attr = {
      id: 152,
      name: "Lotus corniculatus",
      latin: "Birdfoot Deer Vetch",
      exchange_rate: "300 ppm",
      arith_mean: 38.0,
      stderror: 0.0,
      journals: "http://www.co2science.org/data/plant_growth/photo/l/ref/lotusc_ref.php"
    }

    poro = CarbonInfo.new(attr)

    expect(poro).to be_a CarbonInfo
    expect(poro.name).to eq(attr[:name])
    expect(poro.latin).to eq(attr[:latin])
    expect(poro.average_exchange_percentage).to eq(attr[:arith_mean])
    expect(poro.research_journals).to eq(attr[:journals])
  end
end
