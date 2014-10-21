Rails.application.routes.draw do
  root 'main#index'
  resources :events, :activities, :users
  resources :votes, only: [:index, :create, :new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :trips, only: [:create]

  get '/search',                  to: 'activities#search'
  get '/auth/:provider/callback', to: 'authentications#create'
end
