Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' }

  root 'toppages#index'

  resources :users, only: %i[index show]
  resources :products, only: %i[index new show] do
    collection do
      get :product_registration
    end
  end

  resources :likes, only: %i[create destroy]
end
