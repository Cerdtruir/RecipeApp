Rails.application.routes.draw do
  resources :foods
  devise_for :users, controllers: { registrations: 'users/registrations' }, path: ''
  root 'users#index'

  resources :users, only: %i[index show]
end
