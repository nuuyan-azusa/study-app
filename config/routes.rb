Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries
  resources :manners
  resources :options, only: [:index, :new, :create, :show, :edit, :update]
  resources :expressions, only: [:index, :new, :create, :show]
end
