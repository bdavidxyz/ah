Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    resources :attempts
    root to: "questions#index"
  end

  resources :question, only: [:show]
  resources :final, only: [:create]

  get 'welcome/index' 
  root 'welcome#index'
end
