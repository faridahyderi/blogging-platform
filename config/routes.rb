Rails.application.routes.draw do
  # Homepage will list posts
  root "posts#index"

  # Resourceful routes for posts + nested comments
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # Dashboard for logged-in users
  get "/dashboard", to: "dashboard#index"

  # User signup
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  # User login/logout
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Health check (keep this for Rails default)
  get "up" => "rails/health#show", as: :rails_health_check
end

