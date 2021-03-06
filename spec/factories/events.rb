FactoryGirl.define do
  factory :event do
    name              "Photo"
    description       { Faker::Lorem.sentence(40) }
    location          "Amsterdam"
    price             { Faker::Commerce.price }
    capacity          3
    includes_food     true
    includes_drinks   true
    starts_at         { Faker::Time.between(DateTime.now - 2, DateTime.now - 1) }
    ends_at           { Faker::Time.between(DateTime.now + 1, DateTime.now + 2) }
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end

end
