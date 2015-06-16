Rails.application.routes.draw do
  root "dashboard#index"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  get ":name", to: "users#show", as: :user

  delete "/logout", to: "sessions#destroy"

  post "/messages", to: "messages#create"

  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
end
