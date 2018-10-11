Rails.application.routes.draw do
  devise_for :users
  root  'questions#index'                       #ルートパスの指定
  get '/questions/category/:sort', to: "questions#index"

  resources :users, only: [:show,:edit,:update]
  resources :questions, only: [:index, :new, :create, :show] do
        collection do
      get :category
    end
  end
  resources :answers , only: [:index, :create]
  resources :comments , only: [:create]
end

