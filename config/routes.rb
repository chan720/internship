Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
  sessions: "users/sessions",
  registrations: "users/registrations"
}
  ActiveAdmin.routes(self)
  resources :products
  resource :cart, only: [ :show ]

  resources :orders, only: [ :index, :show, :create ] do
    resources :order_items, only: [ :create, :index, :show ]
  end

  root "products#index"
end
