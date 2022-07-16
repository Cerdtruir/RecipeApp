Rails.application.routes.draw do
  resources :users, only: %i[index show]

  resources :recipes, only: %i[index show new create destroy]
  resources :public_recipes, only: %i[index show]

  resources :foods, only: %i[index new create destroy]

  devise_for :users, controllers: { registrations: 'users/registrations' }, path: ''
  root 'users#index'
end
