Rails.application.routes.draw do
  get 'static_pages/index'

  resources :organisations
  resources :users
  resources :shifts

  root 'static_pages#index'
end
