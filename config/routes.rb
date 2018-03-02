Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    resources :attempts
    root to: "questions#index"
  end

  resources :question, only: [:show]
  resources :final, only: [:create, :index]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/auth/google_oauth2', as: :google_oauth
  
  get 'welcome/index' 
  root 'welcome#index'
end
