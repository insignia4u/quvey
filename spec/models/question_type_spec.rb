require 'spec_helper'

describe QuestionType do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
