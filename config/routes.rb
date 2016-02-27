Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show'
  root 'top#index'
  resources :proto, only: [:show, :new, :edit, :update, :destroy]
  post 'prototypes' => 'proto#create'
end
