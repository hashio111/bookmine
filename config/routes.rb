Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' }

  root 'toppages#index'

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
    collection do
      get :product_registration
    end
  end
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
