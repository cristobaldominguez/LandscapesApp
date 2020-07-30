Rails.application.routes.draw do
  resources :landscapes
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'pages/profile'
  root 'pages#index'
end
