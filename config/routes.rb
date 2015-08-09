Rails.application.routes.draw do

  get 'search(/:search_item)' => 'search#index', as: :search

  get 'profiles/:username' => 'profiles#index', as: :profile_view
  post 'profiles/:username/follow' => 'profiles#follow', as: :follow
  post 'profiles/:username/unfollow' => 'profiles#unfollow', as: :unfollow
  post 'profiles/:username/block' => 'profiles#block', as: :block
  post 'profiles/:username/unblock' => 'profiles#unblock', as: :unblock


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
      delete '/signout', to: 'devise/sessions#destroy', as: :signout
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "static_pages#home", to: "devise/sessions#new"
    end
  end

  #route for sign-up wizard
  resources :after_signup

end
