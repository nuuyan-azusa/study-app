Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries, only: [:index, :new, :create, :show, :edit, :update]
  resources :manners, only: [:index, :new, :create, :show]
  resources :options, only: [:index, :new, :create, :show]
  resources :expressions, only: [:index, :new, :create, :show]
end
