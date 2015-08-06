Rails.application.routes.draw do

  resources :posts

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
      root to: "devise/posts#show", as: :user_timeline
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new"
    end
  end

  #route for sign-up wizard
  resources :after_signup

end
