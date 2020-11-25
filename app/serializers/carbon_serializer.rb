class CarbonSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :name, :latin, :average_exchange_percentage, :standard_deviation_error, :research_journals
end
