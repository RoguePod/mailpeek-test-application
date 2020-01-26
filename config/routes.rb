# frozen_string_literal: true

Rails.application.routes.draw do
  mount Mailpeek::Web => '/mailpeek' if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'

  resources :emails, only: %i[new create]

  root to: 'static#index'
end
