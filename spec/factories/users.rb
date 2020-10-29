FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    provider { "Google" }
    token { "jdaklhgu849urfonu9wr" }
  end
end
