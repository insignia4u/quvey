require 'spec_helper'

describe Question do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:survey) }
    it { should validate_presence_of(:question_type) }
    it { should validate_uniqueness_of(:title).scoped_to(:survey_id) }

    it "should requires question invalid" do
      expect(subject).to_not be_valid
    end
  end

  describe "Factory" do
    it "creates a valid question" do
      expect{create(:question)}.to change{Question.count}.by(1)
    end
  end
end
