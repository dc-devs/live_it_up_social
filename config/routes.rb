Rails.application.routes.draw do
  root 'main#index'
  get '/events/pictures',          to: 'events#pictures' #this is soley for testing purposes, i need to be able to view the pictures pages without reaching through a event to do so
  resources :events, :activities, :users
  resources :votes, only: [:index, :create, :new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :trips, only: [:create]
  resources :photos, :only => [:create]

  get '/search',                  to: 'activities#search'
  get '/auth/:provider/callback', to: 'authentications#create'
  get '/events/:id/presentation', to: 'events#presentation'
end
