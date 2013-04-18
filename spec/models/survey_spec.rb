require 'spec_helper'

describe Survey do
  describe "Relations" do
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }

    describe "expired_at validations" do
      before(:each) do
        subject.expired_at = 2.days.ago
      end

      it "requires expired_at to be a future date" do
        expect(subject).to_not be_valid
        expect(subject).to have_at_least(1).errors_on(:expired_at)
      end
    end
  end

  describe "Slugs support" do
    before(:each) do
      @survey = build(:survey)
    end

    it "populates slug" do
      expect{@survey.save}.to change{@survey.slug}
    end
  end

  describe "Factory" do
    it "creates a valid survey" do
      expect{create(:survey)}.to change{Survey.count}.by(1)
    end
  end
end
