FactoryGirl.define do
  factory :question_type do
    sequence(:name) { |n| "Name#{n}" }
  end
end
