source 'https://rubygems.org'

group :assets do
  gem 'sass-rails',         '~> 3.2.3'
  gem 'coffee-rails',       '~> 3.2.1'
  gem 'therubyracer',       '0.11.4',   :platforms => :ruby
  gem 'uglifier',           '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3',            '1.3.7'
  gem 'rspec-rails',        '2.13.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'rb-fsevent',         '0.9.3', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard',              '1.7.0'
  gem 'guard-rspec',        '2.5.3'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

group :test do
  gem 'simplecov',          '0.7.1',    :require => false
  gem 'shoulda-matchers',   '1.4.2'
  gem 'database_cleaner',   '0.9.1'
  gem 'capybara',           '2.0.2'
  gem 'capybara-email',     '2.0.2'
  gem 'fuubar',             '1.1.0'
  gem 'launchy',            '2.2.0'
end

gem 'rails',                '3.2.13'
gem 'jquery-rails',         '2.2.1'
gem 'decent_exposure',      '2.1.0'
gem 'strong_parameters',    '0.2.0'
gem 'omniauth-facebook',    '1.4.1'
gem 'faker',                '1.1.2'
gem 'micromachine',         '1.0.4'
gem 'friendly_id',          '4.0.9'
gem 'default_value_for',    '2.0.2'
