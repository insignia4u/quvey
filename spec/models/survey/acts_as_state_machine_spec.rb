require "spec_helper"

describe Survey do
  subject { create(:survey) }

  describe "State Machine" do
    describe "Default State" do
      it "assigns 'draft' as the default state of the survey" do
        expect(subject.state).to eql('draft')
      end

      it "can be archived" do
        expect{
          subject.archive!
        }.to change{subject.state}.from('draft').to('archived')
      end
    end

    describe "Published State" do
      it "assings 'published' as the new state for a draft survey" do
        expect{
          subject.publish!
        }.to change{subject.state}.from('draft').to('published')
      end

      it "can be archived" do
        subject.publish!

        expect{
          subject.archive!
        }.to change{subject.state}.from('published').to('archived')
      end
    end

    describe "Finders" do
      describe "#draft" do
        before(:each) do
          @survey_1 = create(:survey)
          @survey_2 = create(:survey)
          @survey_2.publish!
        end

        it "lists draft surveys" do
          surveys = Survey.draft
          expect(surveys).to     include(@survey_1)
          expect(surveys).not_to include(@survey_2)
        end
      end

      describe "#published" do
        before(:each) do
          @survey_1 = create(:survey)
          @survey_2 = create(:survey)
          @survey_2.publish!
        end

        it "lists published surveys" do
          surveys = Survey.published
          expect(surveys).to     include(@survey_2)
          expect(surveys).not_to include(@survey_1)
        end
      end

      describe "#archived" do
        before(:each) do
          @survey_1 = create(:survey)
          @survey_2 = create(:survey)
          @survey_2.archive!
        end

        it "lists archived surveys" do
          surveys = Survey.archived
          expect(surveys).to     include(@survey_2)
          expect(surveys).not_to include(@survey_1)
        end
      end
    end

    describe "Helpers" do
      describe "#draft?" do
        it "returns true for draft surveys" do
          expect(subject).to be_draft
        end

        it "returns false for any other state" do
          subject.publish!
          expect(subject).to_not be_draft
        end
      end

      describe "#published?" do
        it "returns true for published surveys" do
          subject.publish!
          expect(subject).to be_published
        end

        it "returns false for any other state" do
          expect(subject).to_not be_published
        end
      end

      describe "#archived?" do
        it "returns true for archived surveys" do
          subject.archive!
          expect(subject).to be_archived
        end

        it "returns false for any other state" do
          expect(subject).to_not be_archived
        end
      end
    end
  end
end
