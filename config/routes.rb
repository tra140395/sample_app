Rails.application.routes.draw do
  root to: "static_pages#home"
  get "static_pages/help"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: %i(new create)
  scope "(:locale)", locale: /en|vi/ do
    resources :microposts
    resources :users
    resources :account_activations, only: :edit
  end
end
