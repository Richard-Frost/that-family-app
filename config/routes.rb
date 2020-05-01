Rails.application.routes.draw do
  resources :requests
  resources :family_connections
  resources :comments
  resources :playdates
  resources :children
  resources :families
  resources :users
  root to: 'static#welcome'
  resources :sessions

  get '/signup' => 'families#new'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/home' => 'users#home' 
  post 'playdates/join' => 'playdates#join'

  resources :playdates do
  	resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end