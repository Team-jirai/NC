class Customers::CartProductsController < ApplicationController

  def show
  	@cart_products = CartProduct.all # cart_product/showのカート商品一覧表示の為
  end

  def create

  end

  def update
    @cart_product = CartProduct.find(params[:id]) #idの箇所はURLと同じ記述
    @cart_product.update(cart_product_params)
    redirect_to request.referer # 遷移前のURLを取得
  end

  def destroy
  	@cart_product = CartProduct.find(params[:id]) #idの箇所はURLと同じ記述
    @cart_product.destroy
    redirect_to request.referer # 遷移前のURLを取得
  end

  def empty_cart #destroy_allカートを空にする為
    @cart_products = current_user.cart_products #ログインユーザーのカートを定義
    @cart_products.destroy_all #全て削除
    redirect_to request.referer # 遷移前のURLを取得

private
  def cart_product_params
    params.require(:cart_product).permit(:number)
  end
end
