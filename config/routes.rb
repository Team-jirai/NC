Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'customers/products#top'

  resource :customers, only: [:edit, :update, :destroy]
  get 'customers/mypage' => 'customers#mypage'
  get 'customers/withdraw' => 'customers#withdraw'

  namespace :customers do
    resources :products, only: [:index, :show] do
    resources :cart_products, only: [:index, :update, :destroy, :create] #do 追加
    end

    # resources :cart_products, only: [:index, :update, :destroy, :create]# showをindexに変更
    delete 'cart_products/empty_cart' => 'cart_products#empty_cart'

    get 'order_lists/input' => 'order_lists#input'# 順番変更とcustomers/削除
    post 'order_lists/confirm' => 'order_lists#confirm'# 順番変更とcustomers/削除
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
  end

end
