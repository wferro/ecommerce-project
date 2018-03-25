Rails.application.routes.draw do
  get 'contact', to: 'store#contact'
  get 'about', to: 'store#about'

  root to: 'brigadeiros#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
