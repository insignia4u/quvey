require 'spec_helper'

describe QuestionType do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Factory" do
    it "creates a valid question_type" do
      expect{create(:question_type)}.to change{QuestionType.count}.by(1)
    end
  end
end
