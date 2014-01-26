Challenge::Application.routes.draw do
  root to: "sessions#new"

  delete "/logout" => "sessions#destroy", as: "logout"

  resources :sessions, only: [:new, :create, :destroy]

  resources :uploads,  only: [:new, :create]
end