require 'spec_helper'

feature "User create new survey" do
  background do
    @user = FactoryGirl.create(:user)
  end

  scenario "create a survey with valid data" do
    login_with_facebook
    
  end
end