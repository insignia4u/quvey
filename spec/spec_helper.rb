require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

OmniAuth.config.test_mode  = true
Capybara.default_wait_time = 15
DatabaseCleaner.strategy   = :truncation

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL, :type => :request
  config.include Capybara::RSpecMatchers, :type => :request

  config.infer_base_class_for_anonymous_controllers = true

  config.order = "random"

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def facebook_auth_data(valid = true)
  user = FactoryGirl.build(:user)

  auth = Hashie::Mash.new
  auth.provider    = user.provider
  auth.uid         = user.uid
  auth.info        = { name: valid ? user.name : "" }
  auth.credentials = {
    token: user.oauth_token, expires_at: user.oauth_expires_at
  }

  auth
end
