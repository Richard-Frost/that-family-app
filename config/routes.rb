Rails.application.routes.draw do
  resources :requests, :except => [:show]
  resources :family_connections
  resources :playdates
  resources :children 
  resources :families
  resources :users
  resources :password_resets
  resources :sessions, only: [:new, :create]
  resources :comments, only: [:edit]
  resources :tags
  #get '/auth/twitter/callback' => 'omniauth_callbacks#twitter'
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
  
  get '/settings' => 'families#settings'
  get '/children/all_clildren' => 'children#all_children'
  resources :playdates do
  resources :comments
  end

  resources :families do
  resources :tags
  end
  
  root to: 'sessions#welcome'
  
end