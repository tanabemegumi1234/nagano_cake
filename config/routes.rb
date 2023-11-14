Rails.application.routes.draw do
  root to:'public/homes#top'
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
get '/items/new'  => 'items#new'
get '/customers/my_page'  => 'customers#show'

   
end
scope module: :public do
get '/about' => 'homes#about'
get '/items'  => 'items#index'

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
