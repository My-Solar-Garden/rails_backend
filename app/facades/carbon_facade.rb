class CarbonFacade
  def self.search(search_term)
    json = CarbonService.search(search_term)
    output = json[:data].map do |plant|
      CarbonInfo.new(plant[:attributes])
    end
  end
end
