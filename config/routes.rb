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
    resources :products, only: [:index, :show]

    resources :cart_products, only: [:show, :update, :destroy, :create]
    delete 'cart_products/empty_cart' => 'customers/cart_products#empty_cart'

    resources :order_lists, only: [:index, :show, :create]
    get 'order_lists/:id/input' => 'customers/order_lists#input'
    post 'order_lists/:id/confirm' => 'customers/order_lists#confirm'
    get 'order_lists/thanks' => 'customers/order_lists#thanks'

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
