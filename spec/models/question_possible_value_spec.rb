require 'spec_helper'

describe QuestionPossibleValue do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:question) }
    it { should validate_uniqueness_of(:title).scoped_to(:question_id) }
  end

  describe "Factory" do
    it "creates a valid question_possible_value" do
      expect{create(:question_possible_value)}.to change{QuestionPossibleValue.count}.by(1)
    end
  end
end
