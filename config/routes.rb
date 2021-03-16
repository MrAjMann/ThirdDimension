Rails.application.routes.draw do
  
  resources :products
  devise_for :users
  root 'home#page'
  get 'home/page'
  patch "/user/:id", to: "user#update"
  
  # get 'posts/:id/cat/:category' , to:'posts#show', as: :show
  # get 'products/:id/:category' , to:'products#show', as: :show
  # get 'products/listing', to: 'product#listing', as: 'product_listing'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
