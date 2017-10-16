Rails.application.routes.draw do

  root 'store#index', as: 'store'

  devise_for :users

  authenticate :user do
    resources :items, only: [:show, :index]
    resources :carts
    resources :line_items, only: [:create]
    resources :orders, only: [:show]
  end

  resources :categories, only: [:show, :index]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
