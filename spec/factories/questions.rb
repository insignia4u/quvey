FactoryGirl.define do
  factory :question do
    survey
    question_type

    title 'Foo'
  end
end
