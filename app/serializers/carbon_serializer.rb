class CarbonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :latin, :average_exchange_percentage, :standard_deviation_error, :research_journals
end
