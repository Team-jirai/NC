class Customers::CartProductsController < ApplicationController

  def show
  	@carts = CartProduct.all # cart_product/showのカート商品一覧表示の為
  end

  def create
  end

  def update
  end

  def destroy
  	@cart = CartProduct.find(params[:customer_id])
    @cart.destroy
    redirect_to request.referer # 遷移前のURLを取得
  end

  def empty_cart
  end
end
