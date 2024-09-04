Rails.application.routes.draw do
  get "home/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
  sessions: "users/sessions",
  registrations: "users/registrations"
}
  ActiveAdmin.routes(self)
  resources :products
  resource :cart, only: [ :show ]
  resources :cart_items, only: [ :create, :update, :destroy ]
  resources :orders, only: [ :index, :show, :create ] do
  resources :order_items, only: [ :create, :index, :show ]
  end
  resources :cart_items do
    member do
      patch :increase
      patch :decrease
    end
  end

  root "products#index"
end
