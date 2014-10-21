Rails.application.routes.draw do
  root 'main#index'
  resources :events, :votes, :activities, :users, :sessions, :trips
  
  get '/search',                  to: 'activities#search'
  get '/auth/:provider/callback', to: 'authentications#create'
end
