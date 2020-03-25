Rails.application.routes.draw do
  get '/trips/search' => 'trips#search', as: 'search'
  post '/trips/search' => 'trips#search'
  get '/alltrips' => 'trips#alltrips', as: 'alltrips'
  get '/allpassengers' => 'passengers#allpassengers', as: 'allpassengers'
  resources :tickets
  resources :passengers
  resources :trips
  resources :aeroplanes
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
