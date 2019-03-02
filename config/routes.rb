Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subscription_requests, only: [:create]
  resources :subscriptions, only: [:create]
  resources :plans
  resources :customers, only: [:create]
end
