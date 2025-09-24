Rails.application.routes.draw do
  # Homepage will list posts
  root "posts#index"

  # Resourceful routes for posts + nested comments
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # Dashboard for logged-in users
  get "/dashboard", to: "dashboard#index"

  
  get "up" => "rails/health#show", as: :rails_health_check
end
