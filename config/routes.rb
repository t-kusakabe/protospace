Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show'
  root 'top#index'
  resources :proto, only: [:show, :new]
  post 'prototypes' => 'proto#create'
end
