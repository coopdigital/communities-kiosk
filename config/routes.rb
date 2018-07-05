Rails.application.routes.draw do
  resources :scans, only: :create
  resources :pages, only: :show


  post '/sms', to: 'twilio#receive', as: 'sms'

  root to: 'pages#index'
end
