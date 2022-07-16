Rails.application.routes.draw do
  resources :foods
  devise_for :users, path: ''
  root 'users#index'

  resources :users, only: %i[index show]
end
