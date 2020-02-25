Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/destroy'
  get 'reservations/show'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'products/name'
  get 'products/details'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
   resources :reviews, only: [:destroy]
  resources :reservations, only: [:destroy, :show]
  get 'your_products', to: 'dashboard#your_products'
  get 'your_bookings', to: 'dashboard#your_bookings'
end

