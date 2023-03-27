Rails.application.routes.draw do
  root "users#search"
  get '/welcome', to: 'welcome#index', as: 'welcome'

  devise_for :users, :controllers => {:registrations => "user/registrations"} 

  resources :users, except: [:new, :create]

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :chatrooms, only: [:index, :create, :show] do
    resources :messages, only: [:create]
    resources :invitations, only: [:create]
  end
  resources :invitations, only: [:index]

  get 'users_search', to: 'users#search', as: 'users_search'
  get 'users_selection', to:'users#selection', as:'users_selection'
  get 'users_display', to: 'users#display', as:'users_display'

end
