Rails.application.routes.draw do
  resources :landscapes
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [] do
    collection do 
      get 'profile'
    end
  end

  get 'pages/user_form'
  root 'pages#index'
end