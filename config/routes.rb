Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' }

  root 'toppages#index'

  resources :posts, only: %i[index create edit update destroy] do
    collection do
      get :search
    end
  end
  resources :users, only: %i[index show] do
    member do
      get :following
      get :followers
    end
    collection do
      get :search
    end
  end
  resources :products, only: %i[index new show] do
    member do
      get :new_post
    end
    collection do
      get :product_registration
    end
  end
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
