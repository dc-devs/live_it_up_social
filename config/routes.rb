Rails.application.routes.draw do
  root 'main#index'
  # I totes get why you like this very short invocation, but it's generating
  # more actions than you need to support, so I would encourage you to
  # constrain the routes generated to ones you actually use, like what i did 2
  # lines below.
  resources :events, :votes, :activities, :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/search',                  to: 'activities#search'
  get '/auth/:provider/callback', to: 'authentications#create'
  get '/razzle' => 'main#razzle'
end
