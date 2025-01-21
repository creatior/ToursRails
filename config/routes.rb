Rails.application.routes.draw do
  resources :clients
  resources :tours

  root "home#index"
end
