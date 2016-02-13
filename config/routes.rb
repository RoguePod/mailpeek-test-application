Rails.application.routes.draw do
  mount Mailpeek::Engine => '/mailpeek' if Rails.env.development?

  resources :emails, only: [:create] do
    collection do
      get :faker
    end
  end

  get '/robots.txt', to: 'static#robots'
  root to: 'static#index'
end
