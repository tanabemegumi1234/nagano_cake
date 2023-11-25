Rails.application.routes.draw do
  root to:'public/homes#top'
  get 'admin'  => 'admin/homes#top'
  devise_for :order_details
  devise_for :orders
  devise_for :cart_items

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'customers' => 'customers#index'
    resources :items, only: [:new, :create, :index, :show,:edit,:update]
  end
  
  scope module: :public do
    get '/about' => 'homes#about'
    get '/items'  => 'items#index'
    get '/customers/my_page'  => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get  '/customers/quit' => 'customers#quit'# 退会確認画面
    patch  '/customers/withdraw' => 'customers#withdraw'# 論理削除用のルーティング
    #resources :addresses,only: [:index, :create, :edit, :update, :destroy]
    get  '/items/:id' =>'items#show',as: 'item'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end