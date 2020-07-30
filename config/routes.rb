Rails.application.routes.draw do
  resources :landscapes
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'pages/profile'
  get 'pages/user_form'
  root 'pages#index'
end
