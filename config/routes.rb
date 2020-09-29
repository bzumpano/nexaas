Rails.application.routes.draw do
  resources :products, only: %i[create update show destroy]
  resources :stores, only: %i[create update show destroy]
end
