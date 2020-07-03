Rails.application.routes.draw do
  resources :landscapes
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'pages#index'
end
