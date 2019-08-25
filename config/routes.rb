Rails.application.routes.draw do
  root 'home#index'
  
  resources :products
  resources :bills
  resources :businesses
  get 'home/index'
  get 'home/compras'
  get 'home/ventas'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
