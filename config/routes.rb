Rails.application.routes.draw do




  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'customers/products#top'
  get 'customers/products/about' => 'customers/products#about'

  get 'customers/mypage' => 'customers#mypage'
  get 'customers/withdraw' => 'customers#withdraw'
  put 'customers/withdraw' => 'customers#withdraw_update'
  get 'customers/fix' => 'customers#fix'
  patch 'customers/fix' => 'customers#fix_update'
  put 'customers/fix' => 'customers#fix_update'



  namespace :customers do
    resources :products, only: [:index, :show]
    resources :product_genres, only: [:show]
    resources :cart_products, only: [:index, :update, :destroy, :create]# showをindexに変更
    delete 'cart_products' => 'cart_products#destroy_all', as:'destroy_all'

    get 'order_lists/input' => 'order_lists#input'# 順番変更とcustomers/削除
    get 'order_lists/confirm' => 'order_lists#confirm'# 追加
    get 'order_lists/thanks' => 'order_lists#thanks'# 順番変更とcustomers/削除
    resources :order_lists, only: [:index, :show, :create]# 順番変更

    resources :shipping_addresses, only: [:index, :edit, :update, :create, :destroy]

  end

  namespace :admins do
    get 'top' => 'order_lists#top'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :order_lists, only: [:index, :show, :update]

    resources :order_details, only: [:update]

    resources :products, only: [:index, :show, :edit, :update, :create, :new]

    resources :product_genres, only: [:index, :edit, :update, :create]

    resources :payment_methods, only: [:index, :edit, :update, :create]

    resources :postages, only: [:index,:edit, :update, :create]
  end

end
