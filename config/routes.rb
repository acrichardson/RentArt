Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do

    resources :reservations, only: [:new, :create, :index] do
      resources :reviews, only: [:new, :create]
    end
  end
  
   resources :reviews, only: [:destroy]
  resources :reservations, only: [:destroy, :show]
  get 'your_products', to: 'dashboard#your_products'
  get 'your_bookings', to: 'dashboard#your_bookings'
end

