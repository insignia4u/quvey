require 'spec_helper'

describe Question do
  describe "Validations" do
    it { should validate_presence_of(:survey) }
    it { should validate_presence_of(:question_type) }
    it { should validate_uniqueness_of(:title).scoped_to(:survey_id) }
  end

  #describe "Valid  " do
  #  it { subject(:question_type).to eq 'multiple-choise' }
  #end
end
