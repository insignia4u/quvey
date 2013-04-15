require "spec_helper"

feature "Facebook login" do
  given!(:oauth_data) { facebook_auth_data }

  background do
    visit root_path
  end

  scenario "Signing in with a Facebook account" do
    OmniAuth.config.mock_auth[:facebook] = oauth_data

    click_on "Sign in with Facebook"

    expect(User.where(provider: "facebook", uid: oauth_data.uid)).to exist

    created_user = User.last
    expect(created_user.name).to eql(oauth_data.info.name)
    expect(created_user.oauth_token).to eql(oauth_data.credentials.token)
    expect(created_user.oauth_token).to eql(oauth_data.credentials.token)
    expect(created_user.oauth_expires_at).
      to eql(oauth_data.credentials.expires_at)
    expect(current_path).to eql(root_path)
    expect(page).to have_content("Sign out")
  end

  scenario "Signing out" do
    OmniAuth.config.mock_auth[:facebook] = oauth_data

    click_on "Sign in with Facebook"

    expect(page).not_to have_content("Sign in with Facebook")

    click_on "Sign out"

    expect(current_path).to eql(root_path)
    expect(page).not_to have_content("Sign out")
    expect(page).to have_content("Sign in with Facebook")
  end
end
