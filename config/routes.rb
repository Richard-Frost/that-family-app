Rails.application.routes.draw do
  resources :comments
  resources :playdates
  resources :children
  resources :families
  resources :users
  root to: 'static#welcome'
  resources :sessions

  get '/signup' => 'families#new'
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  get '/home' => 'users#home' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end