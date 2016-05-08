Rails.application.routes.draw do
  root to: "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create", as: "sessions"
  # get "/cities", to: "cities#index"
  # get "/cities", to: "cities#new", as: "new_cities"
  # post "/cities", to: "cities#create"
  get "/cities/:id", to: "cities#show", as: "city"
  # get "/users/:user_id/cities", to: "library_users#index", as: "user_cities"
  # post "/cities/:city_id/users", to: "library_users#create", as: "library_users"
end
