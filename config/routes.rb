Rails.application.routes.draw do
  resources :products, only: %i[create update show destroy]
  resources :stores, only: %i[create update show destroy]
  resources :stock_items, only: %i[create] do
    resources :operations, only: %i[create], module: :stock_items
  end
end
