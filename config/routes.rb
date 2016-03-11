Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :newests, only: [:index]
  resources :users, only: [:show]
  resources :tags, only: [:index, :show]
  resources :prototypes, except: [:index] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
