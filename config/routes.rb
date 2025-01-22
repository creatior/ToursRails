Rails.application.routes.draw do
  resources :clients
  resources :tours
  resources :bookings

  root "home#index"
end
