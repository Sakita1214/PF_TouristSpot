Rails.application.routes.draw do

  root to: "public/homes#top"

  devise_for :users, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  scope module: :public do
    resources :sights, only: [:index] do
      resources :posts, only: [:new, :create, :show]
      resources :post_comments, only: [:show, :edit, :create, :index, :update, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      collection do
        get "quit"
        patch "out"
      end
    end
  end

  # 退会確認画面
  get "/users/:id/unsubscribe" => "public/users#unsubscribe", as: "unsubscribe"
  # 論理削除用のルーティング
  patch "/users/:id/withdrawal" => "public/users#withdrawal", as: "withdrawal"


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end