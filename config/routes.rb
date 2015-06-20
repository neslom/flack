Rails.application.routes.draw do
  root "dashboard#index"

  get "/login", to: "sessions#new"

  get "/callback", to: "sessions#create"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"

  get "/main", to: "main_chat#index", as: :main_chat

  delete "/logout", to: "sessions#destroy"

  post "/messages", to: "messages#create"

  get "/main_chat", to: "main_chat#index"

  scope "/genres" do
    get "/rock", to: "rock#index"
  end

  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)
end
