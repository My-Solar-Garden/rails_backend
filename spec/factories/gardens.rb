FactoryBot.define do
  factory :garden do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    name { Faker::Address.country }
    description { "This is a description" }
  end
end
