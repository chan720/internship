Rails.application.routes.draw do
  # post "checkout/create", to: "checkout#create"
  post "checkout/create", to: "checkout#create"
  get "orders/:id/success", to: "orders#success", as: :order_success
  get "home/index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
  sessions: "users/sessions",
  registrations: "users/registrations"
}
ActiveAdmin.routes(self)
resources :products do
  resources :reviews, only: [ :create ]
end
resources :payments, only: [ :new, :create ]
resource :cart, only: [ :show ]
resources :order
resources :cart_items, only: [ :create, :update, :destroy ]
resources :order_items, only: [ :index ]
resources :orders, only: [ :index, :show, :create ] do
  resources :order_items, only: [ :create, :index, :show ]
end

  resources :cart_items do
    member do
      patch :increase
      patch :decrease
    end
  end
  root "home#index"
end
