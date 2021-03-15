Rails.application.routes.draw do
  
  resources :products
  devise_for :users
  root 'home#page'
  get 'home/page'
  get 'products/listing', to: 'product#listing', as: 'product_listing'
  patch "/user/:id", to: "user#update"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
