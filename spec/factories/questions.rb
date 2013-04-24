FactoryGirl.define do
  factory :question do
    survey
    question_type
    #question_possible_value

    sequence(:title) { |n| "Title#{n}" }
  end
end
