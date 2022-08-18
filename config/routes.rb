Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks",
    
  }
  # Looks like /blogs/1/comments/edit/:id
  resources :blogs do
    resources :comments
  end
  
  # Looks like /comments/1/comments/edit/:id
  resources :comments do
    resources :comments
  end
  
  get 'history', to: 'comments#history'

  root "blogs#index"
  get "/confirmation_pending" => "static_pages#after_registration_path"

  # Follower System
  get "/profiles/:id", to: "profiles#show", as: "profile"
  
  post "profiles/follow", to: "profiles#follow"
  delete "profiles/unfollow", to: "profiles#unfollow"
  get "/profiles", to: "profiles#index"

  resources :likes, only: [:create, :destroy]
end
