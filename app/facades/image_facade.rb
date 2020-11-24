class ImageFacade
  def self.new_image(name)
    ImageService.new_image(name)
  end
end
