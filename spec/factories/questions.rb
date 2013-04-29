FactoryGirl.define do
  factory :question do
    survey
    question_type

    sequence(:title) { |n| "Title#{n}" }
  end
end
