Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diary, only: [:index]
end
