Rails.application.routes.draw do

  resources :posts

  devise_for :users

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

end
