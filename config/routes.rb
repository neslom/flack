Rails.application.routes.draw do
  root "dashboard#index"

  get "/signup", to: "sessions#create", as: "signup"

  resources :users
end
