Rails.application.routes.draw do
  devise_for :users
   # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #SNS認証を有効化するときにコメントを外して下さい
  get '/users', to: redirect("/users/sign_up")
  # 新規登録時エラーメッセージを表示させるとURLが/usersになるためredirect先を指定する
  root 'questions#index'                       #ルートパスの指定
  get '/questions/category/:sort', to: "questions#index"
  get '/questions', to: redirect("/questions/new")
  get 'notifications/link_through'
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'

  namespace :docs do #テーブルに関係のないページのまとめ
  get :privacy_policy
  get :group_info
  get :term_of_use
  get :about_service
  end

  resources :users, only: [:show,:edit,:update]
  resources :questions, only: [:index, :new, :create, :show] do
        collection do
      get :search
    end
  end
  resources :answers , only: [:index, :create]
  resources :comments , only: [:create]
end

