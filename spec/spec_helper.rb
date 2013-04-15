ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
OmniAuth.config.test_mode = true
Capybara.default_wait_time = 15

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end

def facebook_auth_data(valid = true)
  user = FactoryGirl.build(:user, :from_facebook)
  auth = Hashie::Mash.new
  auth.provider = user.provider
  auth.uid = user.uid
  auth.info = { email: valid ? user.email : "" }
  auth.credentials = { token: "0909090909", expires_at: 1346878866 }
  auth
end
