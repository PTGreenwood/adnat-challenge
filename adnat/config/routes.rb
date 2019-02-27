Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/index'

  resources :organisations do
    resources :users
  end

  #Custom routing.
  get 'organisations/join/:id', to: 'users#join'
  get 'organisations/leave/:id', to: 'users#leave'

  resources :users
  root 'static_pages#index'
end
