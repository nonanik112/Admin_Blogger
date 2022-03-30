Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'categories/index'
  get 'categories/edit'
  get 'categories/new'
  get 'categories/show'
  get 'home/index'
  root  'home#index'
  resources :posts
  resources :categories

  get '/about', :to => 'pages#about'
  get '/contact', :to => 'pages#contact'
  get '/resources', :to => 'pages#resources'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
