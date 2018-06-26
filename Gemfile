# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '5.2.0'

gem 'active_interaction'
gem 'bootsnap', require: false
gem 'bootstrap'
gem 'coffee-rails'
gem 'faker'
gem 'god'
gem 'jbuilder'
gem 'jquery-rails'
gem 'puma'
gem 'redcarpet'
gem 'sass-rails'
gem 'sidekiq', require: 'sidekiq/web'
gem 'slim-rails'
gem 'sqlite3'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'

group :development do
  gem 'bullet'
  gem 'guard-rubocop'
  gem 'listen'
  gem 'mailpeek', path: 'gems/mailpeek'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'simplecov'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
