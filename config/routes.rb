Rails.application.routes.draw do
  resources :recipes
  resources :foods
  devise_for :users, controllers: { registrations: 'users/registrations' }, path: ''
  root 'users#index'

  resources :users, only: %i[index show]
end
