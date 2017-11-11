Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'mains#index'

  resources :furnitures

  get '/about', to: 'abouts#about', as: :about
end
