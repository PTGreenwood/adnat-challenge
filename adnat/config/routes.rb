Rails.application.routes.draw do
  get 'static_pages/index'

  resources :organisations

  root 'static_pages#index'
end
