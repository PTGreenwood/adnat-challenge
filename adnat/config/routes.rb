Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/index'

  resources :organisations do
    resources :users
  end

  #Custom routing.
  get 'organisations/join/:id', to: 'users#join'

  resources :users
  root 'static_pages#index'
end
