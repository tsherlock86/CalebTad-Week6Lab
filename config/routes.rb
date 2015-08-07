Rails.application.routes.draw do

  get 'profiles/:username' => 'profiles#index', as: :profile_view
  post 'profiles/follow' => 'profiles#follow'
  post 'profiles/unfollow' => 'profiles#unfollow'


  resources :squawks

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
