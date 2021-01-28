Rails.application.routes.draw do
scope "(:locale)", locale: /en|vi/ do
  root to: "static_pages#home"
  get "static_pages/help"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: %i(new create show edit)
  resources :microposts
  end
end
