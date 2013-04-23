require 'spec_helper'

describe Question do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:survey) }
    it { should validate_presence_of(:question_type) }
    it { should validate_uniqueness_of(:title).scoped_to(:survey_id) }
  end

  describe "Factory" do
    it "creates a valid question" do
      expect{create(:question)}.to change{Question.count}.by(1)
    end
  end
end
