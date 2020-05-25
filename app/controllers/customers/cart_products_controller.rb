class Customers::CartProductsController < ApplicationController

   before_action :authenticate_customer!# ログインしているユーザーのみ入れる

  def index
    @cart_product = CartProduct.new
  	@cart_products = current_customer.cart_products # current_customerの商品のみ表示
    # ログインしていないユーザーもカートに追加できるようにする
  end

  def create
    # 顧客が同じ商品をカートに入れているか確認
    @cart_product = CartProduct.find_by(customer_id: current_customer.id, product_id: cart_product_params[:product_id])
    # あれば
    if @cart_product.present?
      # 更新
       result = @cart_product.number + cart_product_params[:number].to_i #cart_product_params[:number]はハッシュで入っている（例：{ number: 1, product_id: 2, hoge: 'hoge', hige: 'hige' }）
       @cart_product.number = result
    # 無ければ
    else
      # 新規作成
      @cart_product = CartProduct.new(cart_product_params)
      @cart_product.customer_id = current_customer.id #customersの情報
    end

    if @cart_product.save
    # @cart_productには１つのレコードが保存
      redirect_to customers_cart_products_path
    # (@cart_product.id)で保存されたから次のページに飛べるとべる
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

  def destroy_all #destroy_allカートを空にする為
    @cart_products = current_customer.cart_products #ログインユーザーのカートを定義
    @cart_products.destroy_all #全て削除
    redirect_to request.referer # 遷移前のURLを取得
  end

private

  def cart_product_params
    params.require(:cart_product).permit(:number, :product_id) #:product_idでどの商品か判断している。paramsはformから送られてきたのを許可するための記述。
  end
end

