FactoryGirl.define do
  factory :survey do
    user

    name       { Faker::Lorem.words }
    expired_at { 3.days.from_now }
  end
end
