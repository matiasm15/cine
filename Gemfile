# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# Rack middleware for blocking & throttling
# https://github.com/kickstarter/rack-attack
gem 'rack-attack'

# Use postgresql as the database for Active Record
# https://bitbucket.org/ged/ruby-pg
gem 'pg'

# Build JSON APIs with ease
# https://github.com/rails/jbuilder
gem 'jbuilder'

# Use Puma as the app server
# http://puma.io
gem 'puma'

# Bussines days and holidays
# https://github.com/bokmann/business_time
gem 'business_time'

# A set of functions to deal with holidays in Ruby.
# https://github.com/holidays/holidays
gem 'holidays'

# Redis Client
# https://github.com/redis/redis-rb
gem 'redis'
gem 'redis-rails'

# Password hashing
# https://github.com/codahale/bcrypt-ruby
gem 'bcrypt'

# Pry as rails console
# https://github.com/rweng/pry-rails
gem 'pry-rails'

# Simple, efficient background processing for Ruby
# https://github.com/mperham/sidekiq
gem 'sidekiq'

# A clean, powerful, customizable and sophisticated paginator for Rails
# https://github.com/amatsuda/kaminari
gem 'kaminari'

# Link header pagination for Rails and Grape APIs
# https://github.com/davidcelis/api-pagination
gem 'api-pagination'

# Flexible authentication solution for Rails with Warden
# https://github.com/plataformatec/devise
gem 'devise'

# A pure ruby implementation of the JSON Web Token (JWT) standard
# https://github.com/jwt/ruby-jwt
gem 'jwt'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # Static code analyzer
  # https://github.com/bbatsov/rubocop
  gem 'rubocop'

  # Gem vulnerability checker
  # https://github.com/appfolio/gemsurance
  gem 'gemsurance'

  # Static analysis security scanner for Ruby on Rails
  # https://github.com/presidentbeef/brakeman
  gem 'brakeman'
end

group :development do
  # Annotate with model schema models, and tests
  # https://github.com/ctran/annotate_models
  gem 'annotate'

  # Provides iteration per second benchmarking for Ruby
  # https://github.com/evanphx/benchmark-ips
  gem 'benchmark-ips'

  # The Listen gem listens to file modifications and notifies you about the changes
  # https://github.com/guard/listen
  gem 'listen'
end

group :test do
  # Code coverage for Ruby
  # https://github.com/colszowka/simplecov
  gem 'simplecov'
end
