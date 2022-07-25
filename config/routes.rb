Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks",
    
  }
  root "blogs#index"
  resources :blogs
  
  get "/confirmation_pending" => "static_pages#after_registration_path"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
