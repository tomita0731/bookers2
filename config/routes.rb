Rails.application.routes.draw do
  
  root to:"homes#top"
  get 'homes/about'
  devise_for :users
  resources :books, only: [:index, :show, :edit]
  resources :users, only: [:index, :show, :edit, :delete]
  
  resources :users do
  resources :books, only: :index
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end