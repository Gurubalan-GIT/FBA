Rails.application.routes.draw do
  resources :tickets
  resources :passengers
  get '/trips/search' => 'trips#search', as: 'search'
  post '/trips/search' => 'trips#search'
  resources :trips
  resources :aeroplanes
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
