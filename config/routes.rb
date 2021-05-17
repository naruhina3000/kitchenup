Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kitchens do
    resources :bookings, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :favorites, only: [:index, :destroy]

  resources :bookings, only: [:index, :show, :new, :edit] do
    resources :reviews, only: [:create, :update]
  end
  post "/bookings/:id", to: "bookings#clean", as: :clean_kitchen
  get "/bookings/:id", to: "bookings#status", as: :booking_status

end
