Rails.application.routes.draw do
  resources :ios
  resources :profiles
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'control_panel#index'

  get '/control_panel', to: 'control_panel#index'

  resources :devices

end
