Rails.application.routes.draw do
  resources :clients
  resources :tours
  resources :bookings

  root "home#index"
  match "*unmatched", to: "application#render_404", via: :all
end
