# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.4'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

gem 'administrate', '~> 0.18.0'
gem 'annotate', '~> 3.2'
gem 'aws-sdk-s3', '~> 1.114'
gem 'client_side_validations', '~> 20.0', '>= 20.0.2'
gem 'draper', '~> 4.0', '>= 4.0.2'
gem 'factory_bot_rails', '~> 6.2'
gem 'ffaker', '~> 2.21'
gem 'haml-rails', '~> 2.0'
gem 'image_processing', '~> 1.12', '>= 1.12.2'
gem 'jquery-rails', '~> 4.5'
gem 'omniauth', '~> 2.0', '>= 2.0.4'
gem 'omniauth-google-oauth2', '~> 1.0', '>= 1.0.1'
gem 'omniauth-rails_csrf_protection'
gem 'pagy', '~> 5.10', '>= 5.10.1'
gem 'sass-rails', '~> 6.0'
gem 'shrine', '~> 3.4'

gem 'friendly_id', '~> 5.5'

gem 'font-awesome-sass', '~> 6.2.1'

gem 'devise', '~> 4.8', '>= 4.8.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails', '~> 1.1', '>= 1.1.5'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '~> 1.3', '>= 1.3.2'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '~> 1.2', '>= 1.2.1'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.11', '>= 2.11.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.15', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'bullet', '~> 7.0', '>= 7.0.4'
  gem 'debug', '~> 1.7', platforms: %i[mri mingw x64_mingw]
  gem 'lefthook', '~> 1.2', '>= 1.2.4', require: false
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'rubocop', '~> 1.39', require: false
  gem 'rubocop-performance', '~> 1.15', '>= 1.15.1', require: false
  gem 'rubocop-rails', '~> 2.17', '>= 2.17.3', require: false
  gem 'rubocop-rspec', '~> 2.15', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'brakeman', '~> 5.4', require: false
  gem 'bundle-audit', '~> 0.1.0'
  gem 'database_consistency', '~> 1.7', require: false
  gem 'erb2haml', '~> 0.1.5'
  gem 'fasterer', '~> 0.10.0', require: false
  gem 'letter_opener_web', '~> 2.0'
  gem 'rails_best_practices', '~> 1.23', '>= 1.23.2', require: false
  gem 'web-console', '~> 4.2'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'capybara', '~> 3.38'
  gem 'selenium-webdriver', '~> 4.7', '>= 4.7.1'
  gem 'shoulda-matchers', '~> 5.2'
  gem 'simplecov', '~> 0.21.2'
  gem 'webdrivers', '~> 5.2'
end
