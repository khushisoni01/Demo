Rails.application.routes.draw do
  get 'new_product/myproducts', to: 'products#myproduct'
  resources :products do
    resources :orders
  end

  get 'orders/new', to: 'orders#new', as: :new_order
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#home'
  resources :pages
  devise_for :accounts, controllers: {registrations: 'registrations'}
  # get '/posts/basic_account', to: 'posts#basic', as: 'basic'
  # get '/posts/business_account', to: 'posts#business', as: 'business'
  devise_scope :account do
    post 'accounts/:id/follow', to: "registrations#follow", as: "follow"
    post 'accounts/:id/unfollow', to: "registrations#unfollow", as: "unfollow"
    post 'accounts/:id/accept', to: "registrations#accept", as: "accept"
    post 'accounts/:id/cancel', to: "registrations#cancel", as: "cancel"
  end
  
  get 'new_post/myposts', to: 'posts#mypost'
  post 'posts/:id/upvote', to: "posts#upvote", as: "like"
  post 'posts/:id/downvote', to: "posts#downvote", as: "dislike"
  resources :posts
end
