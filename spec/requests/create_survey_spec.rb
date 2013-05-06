require 'spec_helper'

feature "User create new survey" do
  
  scenario "create a survey with valid data" do
    login_with_facebook

    visit '/surveys/new'

    fill_in "survey[name]", with: "My First Survey"
    
    date = 4.days.from_now
    select date.year.to_s,      from: "survey_expired_at_1i"
    select date.strftime("%B"), from: "survey_expired_at_2i"
    select date.day.to_s,       from: "survey_expired_at_3i"

    click_on "Create Survey"

    current_user = User.last
    expect(current_path).to eql("/")
    expect(Survey.where(slug: "my-first-survey")).to exist
    expect(Survey.last[:state]).to eql('draft')
    expect(current_user.surveys).to include(Survey.last)
  end

  scenario "create a survey with invalid data" do
    login_with_facebook

    visit "/surveys/new"

    click_on "Create Survey"

    expect(current_path).to eql("/surveys")
    expect(Survey.count).to eql(0)
  end

  scenario "requires a logged in user" do
    visit "/surveys/new"

    expect(current_path).to eql("/")
  end
end
