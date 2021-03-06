# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'

require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/controllers/application_controller.rb'
  add_filter 'vendor'
end

require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'sidekiq/testing'

# execute all jobs immediately
Sidekiq::Testing.inline!

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each do |file|
  require file
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
    ActionMailer::Base.deliveries.clear
    Sidekiq::Worker.clear_all
  end
end
