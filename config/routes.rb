Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/customers/mypage' => 'customers#mypage'
  get '/customers/withdraw' => 'customers#withdraw'
  delete '/customers/cart_products/empty_cart' => 'customers/cart_products#empty_cart'
  get '/customers/order_lists/:id/input' => 'customers/order_lists#input'
  post '/customers/order_lists/:id/confirm' => 'customers/order_lists#confirm'
  get '/customers/order_lists/thanks' => 'customers/order_lists#thanks'
  get '/' => 'customers/products#top'
  get '/admins/top' => 'admins/order_lists#top'



  resources :customers, only: [:edit, :update, :destroy]
  resources :customers/cart_products, only: [:show, :update, :destroy, :create]
  resources :customers/order_lists, only: [:index, :show, :create]
  resources :customers/shipping_addresses, only: [:index, :edit, :update, :create :destroy]
  resources :customers/products, only: [:index, :show]

  resources :admins/product_gunres, only: [:index, :edit, :update, :create]
  resources :admins/customers, only: [:index, :show :edit, :update]
  resources :admins/order_lists, only: [:index, :show, :update]
  resources :admins/order_details, only: [:update]
  resources :admins/products, only: [:index, :show, :edit, :update, :create, :new]
  
end
