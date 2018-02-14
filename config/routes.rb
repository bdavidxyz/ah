Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    root to: "questions#index"
  end

  get 'question/facile', to: 'question#facile'
  get 'question/difficile', to: 'question#difficile'
  post 'question/attempt', to: 'question#submit_attempt'
  get 'welcome/index' 
  get 'final/index' 
  root 'welcome#index'
end
