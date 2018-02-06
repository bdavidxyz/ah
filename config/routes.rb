Rails.application.routes.draw do
  get 'welcome/index'
  get 'final', to: 'final#index'
  get 'attempt', to: 'attempt#index'
 
  root 'welcome#index'
end
