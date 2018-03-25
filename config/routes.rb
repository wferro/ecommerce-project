Rails.application.routes.draw do
  get 'store/contact'

  get 'store/about'

  get 'brigadeiros/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
