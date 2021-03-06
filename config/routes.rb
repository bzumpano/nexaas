Rails.application.routes.draw do
  resources :products, only: %i[create update show destroy]
  resources :stores, only: %i[create update show destroy]
  resources :stock_items, only: %i[create show] do
    resources :inputs, only: %i[create show], module: :stock_items
    resources :outputs, only: %i[create show], module: :stock_items
  end
end
