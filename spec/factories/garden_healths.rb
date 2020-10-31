FactoryBot.define do
  factory :garden_health do
    sensor

    # Temperature readings

    trait :high_temp do
      # set at 26 C and up (78 degrees F and up)
      reading_type { 3 }
      reading { Faker::Number.between(from: 26, to: 70) }
    end

    trait :mid_temp do
      # set at 10 C to 25 C(50 degrees F to 77)
      reading_type { 3 }
      reading { Faker::Number.between(from: 10, to: 25) }
    end

    trait :low_temp do
      # set at -20 C to 9 C(-4 degrees F to 49)
      reading_type { 3 }
      reading { Faker::Number.between(from: -20, to: 9) }
    end

    trait :freezing_temp do
      reading_type { 3 }
      reading { 0 }
    end

    # Light readings

    trait :very_bright do
      reading_type { 2 }
      reading { Faker::Number.between(from: 740, to: 780) }
    end

    trait :bright do
      reading_type { 2 }
      reading { Faker::Number.between(from: 540, to: 739) }
    end

    trait :mid_level do
      reading_type { 2 }
      reading { Faker::Number.between(from: 101, to: 539) }
    end

    trait :dim do
      reading_type { 3 }
      reading { Faker::Number.between(from: 30, to: 100) }
    end

    trait :very_dim do
      reading_type { 3 }
      reading { Faker::Number.between(from: 0, to: 5) }
    end
  end
end
