Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


  # アプリケーションのトップページ（ルートURL /）にアクセスした際、StaticPagesControllerのtopアクションを呼び出す設定
  # ルートURLの割り当てをする
  root "static_pages#top"
  # ユーザーの新規作成（create）と入力画面を表示(new)のルートのみを生成
  resources :users, only: %i[ new create ]

  # コントローラーはusersディレクトリの下にあると明示することで、controllersディレクトリ配下のControllerを見に行かないようにする
  resource :status, only: %i[ edit update ], controller: "users/statuses"

  # 全ユーザーのステータス画面は別で一覧を用意する
  resources :statuses, only: %i[ index ]

  # ログイン画面を表示するルート
  get "login", to: "user_sessions#new"
  # ログイン処理をするルート
  post "login", to: "user_sessions#create"
  # ログアウト処理をするルート
  # ログアウトという操作は、ログインセッションを破棄する操作だからDELETEを使う
  delete "logout", to: "user_sessions#destroy"

  # Defines the root path route ("/")
  # root "posts#index"
end
