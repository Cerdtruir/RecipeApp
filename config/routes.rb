Rails.application.routes.draw do
  resources :users, only: %i[index show]

  resources :foods, only: %i[index new create destroy]

  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: %i[new create edit update destroy]
  end

  resources :public_recipes, only: %i[index show]

  resources :shopping_lists, only: %i[index], path: 'shopping_list'

  devise_for :users, controllers: { registrations: 'users/registrations' }, path: ''
  root 'users#index'
end
