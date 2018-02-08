Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    root to: "questions#index"
  end

  get 'question/facile', to: 'question#facile'
  get 'question/difficile', to: 'question#difficile'
  get 'welcome/index' 
  root 'welcome#index'
end
