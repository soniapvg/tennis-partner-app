Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create]
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  get '/welcome', to: 'welcome#index', as: 'welcome'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  post 'invitation', to: 'users#invitation', as: 'invitation'

end
