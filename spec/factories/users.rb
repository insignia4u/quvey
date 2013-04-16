FactoryGirl.define do
    factory :user do
        provider         "facebook"
        uid              { rand(Time.now.to_i).to_s }
        name             { Faker::Name.name }
        oauth_token      { rand(Time.now.to_i).to_s }
        oauth_expires_at { 10.days.from_now }
    end
end
