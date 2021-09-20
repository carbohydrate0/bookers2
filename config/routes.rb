Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users

  root to: 'homes#top'
  resources :book, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end
