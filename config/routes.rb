Rails.application.routes.draw do
  get 'welcome/index'
  get 'final/index'
 
  root 'welcome#index'
end
