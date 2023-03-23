Rails.application.routes.draw do
  root "users#index"
  get '/welcome', to: 'welcome#index', as: 'welcome'
  post 'invitation', to: 'users#invitation', as: 'invitation'

  devise_for :users
  resources :users, except: [:new, :create]

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :chatrooms, only: [:index, :create, :show] do
    resources :messages, only: [:create]
    resources :invitations, only: [:create]
  end
  resources :invitations, only: [:index]

  # UI prototypes / to be deleted once applied in views
  get 'prototypes/signin', to: 'prototypes#signin'
  get 'prototypes/signup', to: 'prototypes#signup'
  get 'prototypes/settings', to: 'prototypes#settings_index'
  get 'prototypes/settings/photo', to: 'prototypes#settings_photo'
  get 'prototypes/settings/informations', to: 'prototypes#settings_informations'
  get 'prototypes/settings/player_preferences', to: 'prototypes#settings_player_preferences'
  get 'prototypes/settings/account', to: 'prototypes#settings_account'
  get 'prototypes/search', to: 'prototypes#search'
  get 'prototypes/results', to: 'prototypes#results'
  get 'prototypes/player', to: 'prototypes#player'
  get 'prototypes/chatroom', to: 'prototypes#chatroom'
  get 'prototypes/invitations', to: 'prototypes#invitations'
end
