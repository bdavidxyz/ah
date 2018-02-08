Rails.application.routes.draw do
  namespace :admin do
    resources :questions
    root to: "questions#index"
  end

  get 'welcome/index'
  get 'final', to: 'final#index'
  get 'attempt', to: 'attempt#index'
 
  root 'welcome#index'
end
