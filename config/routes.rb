Rails.application.routes.draw do
  get 'home/about', to: 'homes#about'
  devise_for :users

  root to: 'homes#top'
  resources :books, only: [:index, :show]
  resources :book, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
