Rails.application.routes.draw do
  resources :landscapes
  resources :likes
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :edit, :update] do
    collection do 
      get 'profile'
    end
  end

  get 'pages/user_form'
  root 'pages#index'
end