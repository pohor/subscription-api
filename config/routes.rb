Rails.application.routes.draw do

  resources :subscription_requests, only: [:create]
  resources :subscriptions, only: [:create]
  resources :plans
  resources :customers, only: [:create]
end
