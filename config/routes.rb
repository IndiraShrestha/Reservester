Rails.application.routes.draw do
  resources :reserves
  resources :reservations
  devise_for :users
  root 'restaurants#index'

  #roots "pages#home"
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
