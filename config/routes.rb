Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #管理者
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    }
  namespace :admins do
    get 'top' => 'homes#top', as: 'top'
    resources :users,only: [:index, :destroy]
    resources :inqulies, only: [:index, :show]
  end
  #ユーザー
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end

  scope module: :users do
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follower', as: 'follows'
      get 'followers' => 'relationships#followed', as: 'followers'
    end
  end

  #サービス全般
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'search#search'
    resources :chats, only:[:create, :show]
    resources :posts do
      resource :post_comments, only: [:create, :destroy]
      resource :arrows, only: [:create, :destroy] #いいね機能
      resources :item_photes, only: [:create, :update, :destroy]
    end
    resources :tags, only: [:create, :index, :show]
    resources :inqulies, only: [:create, :index, :show]
    resources :requirements, only: [:index]
    resources :group_chats, only: [:create, :destroy]
    resources :groups
  end
end
