Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'events#index'
  resources :events, only: %i[new create index show]
end
