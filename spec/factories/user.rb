FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    age { rand(1..80) }
  end
end
