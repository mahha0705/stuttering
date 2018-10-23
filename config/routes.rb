Rails.application.routes.draw do
  get 'question_comments/create'
  devise_for :users
   # controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #SNS認証を有効化するときにコメントを外して下さい
  get '/users', to: redirect("/users/sign_up")
  # 新規登録時エラーメッセージを表示させるとURLが/usersになるためredirect先を指定する
  root 'questions#index'                       #ルートパスの指定
  get '/questions/category/:sort', to: "questions#index"
  get '/questions', to: redirect("/questions/new")
  get '/questions/:question_id/question_comments', to: redirect("/questions/%{question_id}")
  get '/questions/:question_id/answers', to: redirect("/questions/%{question_id}")
  get '/questions/:question_id/answers/:answer_id/comments', to: redirect("/questions/%{question_id}")
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
    resources :question_comments , only: [:create]
    resources :answers , only: [:index, :create] do
      resources :comments , only: [:create]
    end
        collection do
      get :search
    end
  end
end

