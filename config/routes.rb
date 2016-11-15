Rails.application.routes.draw do

  devise_for :users
  root 'restaurants#index'

  #roots "pages#home"
  resources :restaurants do 
    resources :reservations, only: [:create]
  end

  resources :reserves 
  resources :reservations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
