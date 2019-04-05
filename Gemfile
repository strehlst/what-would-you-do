# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Fontawesome for icons
gem 'font-awesome-sass', '~> 5.6.1'
# Use Bootstrap
gem 'bootstrap', '~> 4.2.1'
# Use jQuery
gem 'jquery-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Haml markup
gem 'haml', '~> 5.0.3'
# Use Haml as templating engine
gem 'haml-rails', '~> 1.0.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.8'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.1'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Devise for authentication
gem 'devise'
# Use CanCanCan for authorization
gem 'cancancan', '~> 2.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 1.1'

# Use translation.io service for i18n
gem 'translation'
# Use gettext syntax
gem 'gettext'
# Use i18n-tasks for maintenance
gem 'i18n-tasks'

# Use cloudinary for image uploads
gem 'cloudinary'

group :production do
  # Use New Relic for application monitoring
  gem 'newrelic_rpm', '~> 6.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Use Rubocop to enforce Ruby style community guidelines
  gem 'rubocop', '~> 0.67.1', require: false
  # Use RSpec for controllers, models and features
  gem 'rspec-rails', '~> 3.8'
  # Use Dotenv to work with environment variables
  gem 'dotenv-rails'
end

group :test do
  # Use Code Climate test-reporter to track test coverage and code quality
  gem 'codeclimate-test-reporter', '~> 1.0.9'
  gem 'simplecov', require: false
  # Add more matchers to use in controller specs
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use letter opener for e-mails
  gem 'letter_opener'
  # Use xray to debug HTML and CSS issues
  gem 'xray-rails', '~> 0.3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
