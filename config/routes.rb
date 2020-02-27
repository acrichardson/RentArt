Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    collection do
      get 'planes'
      get 'helicopters'
      get 'yachts'
      get 'cars'
      get 'others'
    end
    resources :reservations, only: [:new, :create, :show, :index]
  end

  resources :reviews, only: [:destroy]
  resources :reservations, only: [:destroy] do
    resources :reviews, only: [:create]
  end

  get 'your_products', to: 'dashboard#your_products'
  get 'your_bookings', to: 'dashboard#your_bookings'
  get 'my_products', to: 'products#my_products'
end

