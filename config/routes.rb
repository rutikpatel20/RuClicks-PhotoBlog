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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
