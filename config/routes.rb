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
end
