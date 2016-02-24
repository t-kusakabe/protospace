Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :proto, only: [:index, :new]
  post 'prototypes' => 'proto#create'
end
