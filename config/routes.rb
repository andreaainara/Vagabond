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
  get "/users/:id/profile", to: "users#profile", as: "profile"
  # get "/cities", to: "cities#index"
  # get "/cities", to: "cities#new", as: "new_cities"
  # post "/cities", to: "cities#create"
  get "/cities/:id", to: "cities#show", as: "city"
  get "/cities/:id/posts/new", to: "posts#new", as: "new_post"
  post "/cities/:id/posts", to: "posts#create", as: "create_post"
  get "/posts/:id/edit", to:"posts#edit", as: "edit_post"
  get "/posts/:id", to: "posts#show", as: "posts"
  get "/posts/:id", to: "posts#show", as: "show_post"
  patch "/posts/:id", to: "posts#update"
  delete "/posts/:id", to: "posts#destroy", as: "delete_post"
  # get "/users/:user_id/cities", to: "library_users#index", as: "user_cities"
  # post "/cities/:city_id/users", to: "library_users#create", as: "library_users"
end
