Rails.application.routes.draw do
  resources :tickets
  resources :first_classes
  resources :economy_classes
  resources :business_classes
  resources :passengers
  resources :trips
  resources :aeroplanes
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
