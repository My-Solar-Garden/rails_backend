class CarbonInfo
  attr_reader :name,
              :latin,
              :average_exchange_percentage,
              :standard_deviation_error,
              :research_journals

  def initialize(attr)
    @name                        = attr[:name]
    @latin                       = attr[:latin]
    @average_exchange_percentage = attr[:arith_mean]
    @standard_deviation_error    = attr[:stderror]
    @research_journals           = attr[:journals]
  end
end
