FactoryBot.define do
  factory :garden do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    description { "This is a description" }
    name { Faker::FunnyName.name }
  end
end
