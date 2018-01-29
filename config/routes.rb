Rails.application.routes.draw do
  resources :scans, only: :create
  resources :pages, only: :show
  root to: 'pages#index'
end
