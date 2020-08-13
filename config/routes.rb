Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #管理者
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    }
  namespace :admin do
    get 'top' => 'home#top', as: 'top'
    resources :inqulies, only: [:index, :show]
  end
  #ユーザー
  devise_for :users

  scope module: :users do
    resources :users do
      resource :relationships, only: [:create, :destroy]
        get 'follows' => 'relationships#follower'
        get 'followers' => 'relationships#followed'
    end
    resources :chats, only:[:create]
  end

  #サービス全般
  scope module: :public do
    root 'home#top'
    get 'about' => 'home#about'
    get 'search' => 'home#search'
    resources :posts do
      resource :post_comments, only: [:create, :destroy]
      resource :arrows, only: [:create, :destroy] #いいね機能
      resources :item_photes, only: [:create, :update, :destroy]
    end
    resources :tags, only: [:create, :index]
    resources :inqulies, only: [:create, :index, :show]
    resources :requirements, only: [:index]
    resources :group_chats, only: [:create]
    get 'talk_room' => 'group_chats#index', as: 'index_group_chats'
  end
end
