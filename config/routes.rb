Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries
  resources :manners
  resources :options
  resources :expressions, only: [:index, :new, :create, :show]
end
