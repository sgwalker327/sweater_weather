Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      post "/users", to: "users#create"
      post "/sessions", to: "sessions#new"
      post "/road_trip", to: "roadtrip#create"
    end
  end
end
