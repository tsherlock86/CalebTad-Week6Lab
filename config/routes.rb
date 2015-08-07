Rails.application.routes.draw do

<<<<<<< HEAD
  get 'profiles/:username' => 'profiles#index'

  resources :posts
=======
  resources :squawks
>>>>>>> df77b0f1c6d081bd8e60fb378796ad148b0f16e5

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }


  authenticated :user do
    devise_scope :user do
      root to: "squawks#index", as: :user_timeline
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "static_pages#home"
    end
  end

  #route for sign-up wizard
  resources :after_signup

end
