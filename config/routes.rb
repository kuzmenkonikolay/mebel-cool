Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'mains#index'

  resources :furnitures, only: [:index, :show]
  resources :appliances, only: [:index, :show]

  get '/about', to: 'abouts#about', as: :about
  get '/latest', to: 'furnitures#latest', as: :latest
  get '/search', to: 'furnitures#search', as: :search
  get '/search_app', to: 'appliances#search', as: :search_app

  get '/contact_us', to: 'contacts#contact_us', as: :contact_us
  resources :contacts, only: [:create]

  post '/add_to_cart', to: 'carts#add_to_cart', as: :add_to_cart
  post '/create_order', to: 'carts#create_order'
  get '/remove_furniture_from_cart', to: 'carts#remove_furniture_from_cart', as: :remove_furniture_from_cart
  get '/remove_appliance_from_cart', to: 'carts#remove_appliance_from_cart', as: :remove_appliance_from_cart
  resources :carts, only: :index

  get '/show_more_appliances', to: 'appliances#show_more', as: :show_more_appliances
  get '/show_more_furniture', to: 'furnitures#show_more', as: :show_more_furnitures

  match "*missing" => redirect("/"), via: [:get, :post, :put, :patch, :delete]
end
