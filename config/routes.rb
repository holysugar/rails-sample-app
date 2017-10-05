Rails.application.routes.draw do
  root to: "welcome#index"
  resources :books
  resources :users

  resources :orders, only: [:index, :new, :create]
end
