Rails.application.routes.draw do

  root 'store#index', as: 'store'

  resources :sessions
  get '/signin' => 'sessions#new', as: :signin
  post '/signin' => 'sessions#create'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
