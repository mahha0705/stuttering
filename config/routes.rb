Rails.application.routes.draw do

  get 'notifications/link_through'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root  'questions#index'                       #ルートパスの指定
  get '/questions/category/:sort', to: "questions#index"
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'


  resources :users, only: [:show,:edit,:update]
  resources :questions, only: [:index, :new, :create, :show] do
        collection do
      get :search
    end
  end
  resources :answers , only: [:index, :create]
  resources :comments , only: [:create]
end

