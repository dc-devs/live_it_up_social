Rails.application.routes.draw do
  root 'main#index'
  resources :events, :votes, :activities, :users, :sessions
  get '/search', to: 'activities#search'
end
