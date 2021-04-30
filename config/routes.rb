Rails.application.routes.draw do
  resources :requests
  resources :family_connections
  resources :comments
  resources :playdates
  resources :children
  resources :families
  resources :users
  resources :password_resets
  resources :sessions
  get '/auth/twitter/callback' => 'omniauth_callbacks#twitter'
  get '/login' => 'sessions#new'
  get '/menu' => 'sessions#create_menu'
  post '/logout' => 'sessions#destroy' 
  get '/home' => 'users#home' 
  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'
  get '/twitter' => 'families#omniauth_new'
  post 'playdates/join' => 'playdates#join'

  get '/omniuser'=> 'omniauth_callbacks#omniuser'
  get '/omnichild'=> 'omniauth_callbacks#omnichild'
  get '/omnifamily'=> 'omniauth_callbacks#omnifamily'



  root to: 'sessions#welcome'
  resources :playdates do
  resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end