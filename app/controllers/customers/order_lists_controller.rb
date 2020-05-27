class Customers::OrderListsController < ApplicationController

     before_action :authenticate_customer!# ログインしているユーザーのみ入れる

  def index #注文履歴一覧
    # @order_list = OrderList.new
    # @order_lists = OrderList.where(customer_id: current_customer.id) #ログインしているユーザーの注文履歴のみ表示
    @order_lists = current_customer.order_lists.order(id: "DESC") #has_many :order_listsでcustomerとアソシエーションされているため呼び出せる。
  end

  def show #注文履歴詳細
    @order_list = OrderList.find(params[:id])
  end

  def input
    @order_list = OrderList.new
  end

  def confirm
    @cart_products = current_customer.cart_products
    @postage = Postage.find(1)

    if params[:order_list][:address_method] == "self_address"
       payment_method = order_list_params[:payment_method]
              postal_code = current_customer.postal_code
              address = current_customer.address
              shipping_name = current_customer.name_sei + current_customer.name_mei
# session[:input] = {"payment": params[:order_list][:payment_method], "postal_code": current_customer.postal_code, "address": current_customer.address, "name": current_customer.name_sei + current_customer.name_mei}
    elsif params[:order_list][:address_method] == "registered_address"
          payment_method = order_list_params[:payment_method]
            a = ShippingAddress.find(params[:select].to_i) #ShippingAddressのidをfindで見つけてaに入れている。
              postal_code = a.postal_code
              address = a.address
              shipping_name = a.name
# session[:input] = {"payment": params[:order_list][:payment_method], "postal_code": a.postal_code, "address": a.address, "name": a.name }
    elsif params[:order_list][:address_method] == "new_address"
          payment_method = order_list_params[:payment_method]
              postal_code = order_list_params[:postal_code]
              address = order_list_params[:address]
              shipping_name = order_list_params[:shipping_name]
              @shipping_address = ShippingAddress.new(shipping_address_params)
              @shipping_address.customer_id = current_customer.id
              @shipping_address.save
    end
     @order_list = OrderList.new(payment_method: payment_method, postal_code: postal_code, address: address, shipping_name: shipping_name)



    # バリデーションのためのif文
    if params[:order_list][:address_method] == "self_address" && current_customer.postal_code.present? && current_customer.address.present? && payment(params[:order_list][:payment_method])
          render :confirm
    elsif params[:order_list][:address_method] == "registered_address" && @order_list.present? && payment(params[:order_list][:payment_method]) #registered_addressを選択してかつ@order_listに情報が入っておりかつ"支払い方法"を選択していない場合
          render :confirm
    elsif params[:order_list][:address_method] == "new_address" && params[:shipping_address][:postal_code].present? && params[:shipping_address][:address].present? && params[:shipping_address][:name].present? && payment(params[:order_list][:payment_method])
          render :confirm
    else
       redirect_to request.referer # 遷移前のURLを取得
    end
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
  def shipping_address_params
    params.require(:shipping_address).permit(:name, :postal_code, :address)
  end

  def payment(pay)
    if pay == "支払い方法"
      false
    else
      true
    end
  end
end

