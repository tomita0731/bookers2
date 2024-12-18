Rails.application.routes.draw do

  root to:"homes#top"
  get "home/about", to: "homes#about"
  devise_for :users
  resources :books, only: [:index, :show, :edit, :new, :create, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :destroy, :update]

  resources :users do
  resources :books, only: :index
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end