Rails.application.routes.draw do

  resources :posts
  devise_for :users

  # Will change to sign in
  root 'home#index'
  # root 'devise/sessions#new'

end
