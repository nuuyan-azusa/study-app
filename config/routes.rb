Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries, only: [:index, :new, :create, :show]
  resources :manners, only: [:new, :create]
end
