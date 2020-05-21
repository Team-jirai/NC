class Customers::OrderListsController < ApplicationController
     before_action :total_price, only:[:confirm]

  def index #注文履歴一覧
    @order_list = OrderList.new
    @order_lists = OrderList.where(customer_id: current_customer.id) #ログインしているユーザーの注文履歴のみ表示
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
       session[:input] = {"payment": params[:order_list][:payment_method], "postal_code": current_customer.postal_code, "address": current_customer.address, "name_sei": current_customer.name_sei, "name_mei": current_customer.name_mei}
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
       p @order_list
       session[:input] = {"payment": params[:payment_method], "postal_code": @order_list.postal_code , "address": @order_list.address, "name": @order_list.shipping_name }
        #binding.pry
    end
    #タブを閉じるまでセッション内の情報は保持される。
    redirect_to customers_order_lists_confirm_path # inputを保存している
  end# セッションを使うと一時的に保存できる

  def confirm
    @cart_products = current_customer.cart_products

  end

  def thanks
  end

  def create

  end

  private
  def order_list_params
    params.require(:order_list).permit(:postage, :customer_id, :total_price, :status, :payment_method, :shipping_name, :postal_code, :address)
  end
end
