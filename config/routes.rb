Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
