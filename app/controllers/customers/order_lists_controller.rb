class Customers::OrderListsController < ApplicationController
     before_action :total_price, only:[:confirm]
     before_action :authenticate_customer!# ログインしているユーザーのみ入れる

  def index #注文履歴一覧
    # @order_list = OrderList.new
    # @order_lists = OrderList.where(customer_id: current_customer.id) #ログインしているユーザーの注文履歴のみ表示
    @order_lists = current_customer.order_lists #has_many :order_listsでcustomerとアソシエーションされているため呼び出せる。

  end

  def show #注文履歴詳細
    @order_list = OrderList.find(params[:id])
  end

  def input
    @order_list = OrderList.new
  end

  def create_test# inputの情報をセッションに格納しconfirmに表示することができる
    #binding.pry
    if params[:order_list][:address_method].to_i == 1
       session[:input] = {"payment": params[:order_list][:payment_method], "postal_code": current_customer.postal_code, "address": current_customer.address, "name": current_customer.name_sei + current_customer.name_mei}
       #binding.pry
    elsif params[:order_list][:address_method].to_i == 2
       a = ShippingAddress.find(params[:select].to_i) #ShippingAddressのidをfindで見つけてaに入れている。
       session[:input] = {"payment": params[:order_list][:payment_method], "postal_code": a.postal_code, "address": a.address, "name": a.name }
        #binding.pry
    elsif params[:order_list][:address_method] == "3"
      #binding.pry
       @order_list = OrderList.new
       @order_list.postal_code = params[:order_list][:new_postal_code]
       @order_list.address = params[:order_list][:new_address]
       @order_list.shipping_name = params[:order_list][:new_name]
       # p @order_list
       session[:input] = {"payment": params[:payment_method], "postal_code": @order_list.postal_code , "address": @order_list.address, "name": @order_list.shipping_name }
        #binding.pry
    end
    #タブを閉じるまでセッション内の情報は保持される。
    redirect_to customers_order_lists_confirm_path # inputを保存している
  end# セッションを使うと一時的に保存できる

  def confirm
    @cart_products = current_customer.cart_products
    @order_list = OrderList.new
    @postage = Postage.find(1)
  end

  def create
    @order_list = OrderList.new(order_list_params)
    # OrderList.new(order_list_params)=受け取る箱（saveがされていない）
    @cart_products = current_customer.cart_products

      @order_list.customer_id = current_customer.id #会員id
    @cart_products.each do |cart_product| # 清算後のマイバックに入れている商品をorder_detailからcart_productを通して持ってくる
      order_detail = @order_list.order_details.new # order_listの主idはnewに入っている
      order_detail.product_id = cart_product.product_id #商品
      order_detail.price = cart_product.product.price * 1.1 #商品の価格
      order_detail.number = cart_product.number # 商品の個数
  end
    if @order_list.save
    # @order_listには１つのレコードが保存
    @cart_products.destroy_all #ログインユーザーのカートを定義、全て削除
    redirect_to customers_order_lists_thanks_path
    else
      # @order_list.errors.full_messages.each do |msg|
      #   p msg #p = プリント
      # end
      redirect_to request.referer # 遷移前のURLを取得
    end
  end

  def thanks
  end

  private
  def order_list_params
    params.require(:order_list).permit(:shipping_fee, :customer_id, :total_price, :status, :payment_method, :shipping_name, :postal_code, :address)
  end
end
