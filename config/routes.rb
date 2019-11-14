Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
    
  root 'toppages#index'

  resources :users, only: %i[show]
  resources :products, only: %i[index new]
end