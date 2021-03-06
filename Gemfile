ruby '2.5.3'
source 'https://rubygems.org'

gem 'rails', '~> 5.2.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pry-rails'
gem 'dotenv-rails'
gem 'enumerize'
gem 'devise'

gem 'sass-rails', '~> 5.0'
gem 'haml'
gem 'bootstrap-sass'
gem 'bootswatch-rails'
gem 'bh'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

# jQuery plugins
gem 'chosen-rails'

# Legacy post formatting
gem 'redcarpet'

# Pagination
gem 'bootstrap-will_paginate'
gem 'will_paginate'

# Private Messages
gem 'mailboxer'

# Avatars
gem 'gravatar_image_tag'

# SMS Notifications
gem 'phone'
gem 'twilio-ruby', '~> 4.11.1'

gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

group :development, :test do
  # OpenBSD needs this. We won't be running OpenBSD in production, though.
  require 'rbconfig'
  if RbConfig::CONFIG['target_os'] =~ /(?i-mx:bsd|dragonfly)/
    gem 'rb-kqueue', '>= 0.2'
  end

  gem 'rspec-rails'
  gem 'rubocop'
  gem 'faker'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'mysql2'
end

group :test do
  gem 'factory_girl_rails'
  gem 'factory_girl_rspec'
  gem 'should_not'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

