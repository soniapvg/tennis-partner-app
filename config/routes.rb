Rails.application.routes.draw do
  root "users#index"
  get '/welcome', to: 'welcome#index', as: 'welcome'
  get '/parameters', to: 'parameters#index', as: 'parameters'

  devise_for :users, :controllers => {:registrations => "user/registrations"} 

  resources :users, except: [:new, :create]

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :chatrooms, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end
  

  get 'users_search', to: 'users#search', as: 'users_search'
  get 'users_selection', to:'users#selection', as:'users_selection'
  get 'users_display', to: 'users#display', as:'users_display'

  get '*unmatched_route', to: 'application#raise_not_found'

end
