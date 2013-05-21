require 'spec_helper'

describe Question do

  describe "Relations" do
    it { should belong_to(:survey) }
    it { should belong_to(:question_type) }
    it { should have_many(:question_possible_values) }
  end

  describe "Validations" do
    it { should validate_presence_of(:question_type) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:survey_id) }

    it "should requires question invalid" do
      expect(subject).to_not be_valid
    end
  end

  describe "possible values validation" do
    let!(:t_multiple) { create(:question_type, name: 'multiple-choise') }
    let!(:t_options)  { create(:question_type, name: 'options') }

    context "for questions with multiple choise type" do
      before(:each) do
        @question = build(:question, question_type: t_multiple)
      end

      it "needs to have possible values" do
        expect(@question).to have_at_least(1).errors_on(:base)
     end
    end

    context "for questions with options type" do
      before(:each) do
        @question = build(:question, question_type: t_multiple)
      end

      it "needs to have possible values" do
        expect(@question).to have_at_least(1).errors_on(:base)
     end
    end

    context "valid state" do
      before(:each) do
        @question = build(:question, question_type: t_multiple)
        4.times do |i|
          pv       = @question.question_possible_values.build
          pv.title = "Title ##{i}"
        end
      end

      it "is valid" do
        expect(@question).to be_valid
      end
    end
  end

  describe "Factory" do
    it "creates a valid question" do
      expect{create(:question)}.to change{Question.count}.by(1)
    end
  end
end
