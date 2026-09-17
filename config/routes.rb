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
  resources :users, only: %i[ new create ] do
    # この話しかけてもいいよステータスが常にユーザーに紐づいているからネストしてる
    resource :status
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
