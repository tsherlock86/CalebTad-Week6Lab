Rails.application.routes.draw do

  resources :posts

  devise_for :users

  #route for sign-up wizard
  resources :after_signup

  root 'static_pages#home'

end
