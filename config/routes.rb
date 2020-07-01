Rails.application.routes.draw do
  resources :landscapes

  devise_for :users

  root 'home#index'
end
