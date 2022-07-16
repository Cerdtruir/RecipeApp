Rails.application.routes.draw do
  devise_for :users, path: ''
  root 'users#index'

  resources :users, only: %i[index show]
end
