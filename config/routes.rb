Quvey::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout',      to: 'sessions#destroy', as: 'signout'
  match '/survey/new', to: 'surveys#new', as: 'new_survey'

  resources :surveys, only: [:new, :create]

  get "home/index"
  root :to => 'home#index'
end
