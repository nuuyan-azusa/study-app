Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#home"
  resources :diaries do
    get 'diaries/home'
    collection do
      get 'search'
    end
  end
  resources :manners do
    collection do
      get 'search'
    end
  end
  resources :options do
    collection do
      get 'search'
    end
  end
  resources :expressions do
    collection do
      get 'search'
    end
  end
end
