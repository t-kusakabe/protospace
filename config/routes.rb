Rails.application.routes.draw do
  devise_for :users
  root 'populars#index'
  resources :users, only: [:show]
  resources :prototypes, except: [:index] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
