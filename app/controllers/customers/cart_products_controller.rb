class Customers::CartProductsController < ApplicationController

  def index
    @cart_product = CartProduct.new(:number => 1)
  	@cart_products = CartProduct.all # cart_product/showのカート商品一覧表示の為
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    # CartProduct.new(cart_product_params)=受け取る箱（saveがされていない）
    @cart_product.customer_id = current_customer.id #customersの情報
    if @cart_product.save
    # @cart_productには１つのレコードが保存
    redirect_to customers_cart_products_path
    # (@cart_product.id)で保存されたから次のページに飛べる
    else
      redirect_to request.referer # 遷移前のURLを取得
    end
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
  end

private
  def cart_product_params

    params.require(:cart_product).permit(:number, :product_id) #:product_idでどの商品か判断している。paramsはformから送られてきたのを許可するための記述。

  end
end

