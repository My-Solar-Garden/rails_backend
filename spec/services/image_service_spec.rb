require 'rails_helper'

describe ImageService do
  it "returns image information" do
    name = "tomato garden"

    image_data = ImageService.new_image(name)

    expect(image_data).to be_a(String)
  end

  it "returns nil if no image found" do
    name = "kjdhfkjashfkjhaskjdfhaksh"

    image_data = ImageService.new_image(name)

    expect(image_data).to eq(nil)
  end
end
