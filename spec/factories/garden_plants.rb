FactoryBot.define do
  factory :garden_plant do
    garden
    plant
    planted_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
