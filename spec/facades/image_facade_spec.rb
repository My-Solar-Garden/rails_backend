require 'rails_helper'

describe ImageFacade do
  it "returns and image" do
    name = "Tomato Garden"

    image = ImageFacade.new_image(name)

    expect(image).to be_a(String)
  end

  it "returns nil if no image found" do
    name = "kjdhfkjashfkjhaskjdfhaksh"

    image_data = ImageFacade.new_image(name)

    expect(image_data).to eq(nil)
  end
end
