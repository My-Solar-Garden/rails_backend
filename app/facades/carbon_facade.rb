class CarbonFacade
  def self.search(search_term)
    json = CarbonService.search(search_term)
    output = json[:data].map do |plant|
      CarbonInfo.new(plant)
    end
  end
end
