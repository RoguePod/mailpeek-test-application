# frozen_string_literal: true

Mailpeek.configure do |config|
  config.location = Rails.root.join('tmp/mailpeek')
  # config.limit = 30
end
