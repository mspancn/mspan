source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# bootstrap-sass is a Sass-powered version of Bootstrap 3, ready to drop right into your Sass powered applications.
gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# font-awesome-rails provides the Font-Awesome web fonts and stylesheets as a Rails engine for use with the asset pipeline.
gem "font-awesome-rails"

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise'

# The authorization Gem for Ruby on Rails.
gem 'cancancan'

# This gem for Ruby on Rails adds the content of the jQuery FullCalendar plugin
# from Adam Shaw (found here http://arshaw.com/fullcalendar/) within your RoR application
# such that you do not have to download and install all the FullCalendar assets yourself.
gem 'fullcalendar-rails'
gem 'momentjs-rails'

# Enumerated attributes with I18n and ActiveRecord/Mongoid/MongoMapper/Sequel support
gem 'enumerize'

# Audited (previously acts_as_audited) is an ORM extension that logs all changes to your models.
# Audited can also record who made those changes, save comments and associate models related to the changes.
gem "audited", "~> 4.3"
gem "rails-observers", github: 'rails/rails-observers'

# Delayed::Job (or DJ) encapsulates the common pattern of asynchronously executing longer tasks in the background.
gem 'delayed_job_active_record'

# Daemons provides an easy way to wrap existing ruby scripts (for example a self-written server) to be run as a daemon and to be controlled by simple start/stop/restart commands.
gem 'daemons'

# AWS::SES is a Ruby library for Amazon's Simple Email Service's REST API (aws.amazon.com/ses).
gem "aws-ses", "~> 0.6.0", :require => 'aws/ses'

# New Relic is a performance management system, developed by New Relic, Inc (http://www.newrelic.com).
gem 'newrelic_rpm'

# Static page caching for Action Pack (removed from core in Rails 4.0).
# TODO: point to the main branch when it's merged
gem "actionpack-page_caching",
  git: "https://github.com/kord-as/actionpack-page_caching",
  branch: "rails5"

# Easy file attachment management for ActiveRecord https://thoughtbot.com/open-source
gem "paperclip", "~> 5.0.0"

# The Ruby cloud services library.
gem "fog"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
