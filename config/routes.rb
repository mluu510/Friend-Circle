SocialProject::Application.routes.draw do

  resources :users do
    resource :friend_circle
    resources :friend_circle_memberships, :as => :friendships
    resources :posts
  end

  resource :password_reset, only: [:new, :show, :create, :edit, :update]
  resource :session

end
