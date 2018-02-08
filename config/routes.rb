Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    root to: "questions#index"
  end
  namespace :question do
    get 'facile', to: 'question#facile'
    get 'diffile', to: 'question#difficle'
    root 'question#index'
  end

  get 'welcome/index' 
  root 'welcome#index'
end
