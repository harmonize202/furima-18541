Rails.application.routes.draw do
  devise_for :users
  # ホームページ(http://localhost:3000/)はitemsコントローラーのindexアクションへ飛ぶ。
  root to: "items#index" 
  resources :items, only: [:index, :new, :create, :show, :edit]
end
