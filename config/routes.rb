Rails.application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: %i(new create)
  scope "(:locale)", locale: /en|vi/ do
    resources :microposts
    resources :users
  end
end
