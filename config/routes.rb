Rails.application.routes.draw do

  get 'customer/order'

  get 'customer/checkout'

  get 'contact', to: 'store#contact'
  get 'about', to: 'store#about'
  get 'brigadeiros', to: 'brigadeiros#index'
  get 'brigadeiros/:id', to: 'brigadeiros#show'
  post 'brigadeiros/:id/addCart', to: 'brigadeiros#addCart', as: 'addCart'
  resources :brigadeiros

  get 'cart', to: 'customer#cart'
  get 'removeCart', to: 'brigadeiros#removeCart', as: 'removeCart'
  get 'removeItemCart/:id', to: 'customer#removeItemCart', as: 'removeItemCart'
  post 'updateItemCart/:id', to: 'customer#updateItemCart', as: 'updateItemCart'



  root to: 'brigadeiros#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
