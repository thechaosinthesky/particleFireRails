Rails.application.routes.draw do
  resources :ios
  resources :profiles
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'control_panel#index'

  get '/control_panel', to: 'control_panel#index'

  resources :users do
    resources :devices
    resources :profiles, only: [:index, :new, :create]
  end

  resources :profiles, only: [:show, :edit, :update, :destroy] do
    resources :ios, only: [:index, :new, :create]
  end

  resources :ios, only: [:show, :edit, :update, :destroy] 
  get 'ios/:id/status', to: 'ios#status'
  post 'ios/:id', to: 'ios#trigger'

  put 'verify_pin', to: 'application#verify_pin'

end
