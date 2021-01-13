Rails.application.routes.draw do
  root to: 'diaries#index'
  resources :diary, only: [:index]
end
