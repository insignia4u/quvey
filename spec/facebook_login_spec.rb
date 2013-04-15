require "spec_helper"

feature "Facebook login" do

  scenario "Signing in with a facebook account" do
    OmniAuth.config.mock_auth[:facebook] = oauth_data
    #click_on "Login with facebook"
    #expect(User.where(email: oauth_data.info.email)).to exist
    #expect(User.last.provider).to eql("facebook")
    #expect(User.last.uid).to eql(oauth_data.uid)
    #expect(current_path).to eql welcome_path
  end

end
