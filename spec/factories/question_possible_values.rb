FactoryGirl.define do
  factory :question_possible_value do

    sequence(:title) { |n| "Title#{n}" }
  end
end
