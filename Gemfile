source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.1.6'
gem 'pg'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'sass-rails', '>= 3.2'
gem 'autoprefixer-rails'
gem "font-awesome-rails"
gem 'jquery-ui-rails'
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'
gem 'twilio-ruby', '~> 3.12'
gem 'whenever', require: false
gem 'faker'

gem 'carrierwave'
gem 'fog'
gem 'rmagick', :require => 'RMagick'


group :development do
  gem 'guard-rspec', '~> 3.0.2'
  gem 'guard-spork', '~> 1.5.1'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'rb-fsevent', '~> 0.9.3'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
end

group :test do
  gem 'shoulda'
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver", "~> 2.35.1"
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
