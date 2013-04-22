require 'spec_helper'

describe QuestionPossibleValue do
  describe "Validations" do
    it { should validate_presence_of(:question) }
    it { should validate_uniqueness_of(:title).scoped_to(:question_id) }
  end
end
