FactoryGirl.define do
  factory :question_possible_value do
    question
    
    sequence(:title) { |n| "Title#{n}" }
  end
end
