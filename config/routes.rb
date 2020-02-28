Rails.application.routes.draw do
  get 'requests/new'
  get 'requests/create'
  get 'requests/edit'
  get 'requests/update'
  get 'requests/destroy'
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
      get 'categories/:category', to: 'products#categories', as: :category
    end
    resources :reservations, only: [:new, :create, :show, :index]
    resources :requests, only: [:new, :create, :show, :index]
  end

  resources :reviews, only: [:destroy]
  resources :requests, only: [:destroy]
  resources :reservations, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end
  get 'my_reservations', to: 'reservations#my_reservations'
  get 'my_products', to: 'products#my_products'
  get 'my_requests', to: 'requests#my_requests'
  get 'my_product_reservations', to: 'reservations#my_product_reservations'
  get 'my_product_requests', to: 'reservations#my_product_requests'
end
