Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'rooms/index'
  get 'new_product/myproducts', to: 'products#myproduct'
  resources :products do
    resources :orders
  end

  

  get 'orders/new', to: 'orders#new', as: :new_order
  get 'all_orders', to: 'orders#all_orders', as: :all_orders
  get 'edit_orders/:id', to: 'orders#edit_orders', as: :edit_orders

  root 'pages#home'
  # root 'rooms#index'

  
  # get "account/:id", to: "registrations#show", as: "account"
  resources :rooms do
    resources :messages
  end
  resources :pages
  devise_for :accounts, controllers: {registrations: 'registrations'}
  # get '/posts/basic_account', to: 'posts#basic', as: 'basic'
  # get '/posts/business_account', to: 'posts#business', as: 'business'
  devise_scope :account do
    post 'accounts/:id/follow', to: "registrations#follow", as: "follow"
    post 'accounts/:id/unfollow', to: "registrations#unfollow", as: "unfollow"
    post 'accounts/:id/accept', to: "registrations#accept", as: "accept"
    post 'accounts/:id/cancel', to: "registrations#cancel", as: "cancel"
    get 'accounts/:id', to: 'registrations#show', as: 'account'
  end
  
  get 'new_post/myposts', to: 'posts#mypost'
  post 'posts/:id/upvote', to: "posts#upvote", as: "like"
  post 'posts/:id/downvote', to: "posts#downvote", as: "dislike"
  get 'all_order', to: "posts#all_order", as: :all_order
  resources :posts


  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
