Rails.application.routes.draw do
  root "dashboard#index"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"

end
