Rails.application.routes.draw do
  resources :posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#home'
  resources :pages
  devise_for :accounts, controllers: {registrations: 'registrations'}
  get '/posts/basic_account', to: 'posts#basic_account', as: 'basic_account'
  get '/posts/business_account', to: 'posts#business_account', as: 'business_account'
end
