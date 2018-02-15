Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    root to: "questions#index"
  end

  match 'final' => 'final#index', via: [:get, :post]

  get 'question/facile', to: 'question#facile'
  get 'question/difficile', to: 'question#difficile'
  post 'question/attempt', to: 'question#validate_attempt'
  get 'welcome/index' 
  root 'welcome#index'
end
