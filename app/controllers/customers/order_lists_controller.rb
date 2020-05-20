class Customers::OrderListsController < ApplicationController
     before_action :total_price, only:[:confirm]

  def index #注文履歴一覧
    @order_list = OrderList.new
    @order_lists = OrderList.where(customer_id: current_customer.id) #ログインしているユーザーの注文履歴のみ表示
  end

  def show #注文履歴詳細
    @order_list = OrderList.find(params[:id])
    @order_lists = OrderList.where(customer_id: current_customer.id)
  end

  def input
    @user = current_customer
  end

  def create_test# inputの情報をセッションに格納しconfirmに表示することができる
    if params[:address_method].to_i == 1
       session[:input] = {"payment": params[:payment_method],"address": current_customer.address}
    elsif params[:address_method].to_i == 2
       a = ShippingAddress.find(params[:select].to_i)
       session[:input] = {"payment": params[:payment_method],"address": a.address}
    elsif params[:address_method].to_i == 3
       a = postal_code.find(params[:select].to_i)
       session[:input] = {"payment": params[:payment_method],"address": a.postal_code}
       a = address.find(params[:select].to_i)
       session[:input] = {"payment": params[:payment_method],"address": a.address}
       a = name.find(params[:select].to_i)
       session[:input] = {"payment": params[:payment_method],"address": a.name}
    end
    #タブを閉じるまでセッション内の情報は保持される。
    redirect_to customers_order_lists_confirm_path # inputを保存している
  end# セッションを使うと一時的に保存できる

  def confirm
    @cart_products = current_customer.cart_products
    @order_lists = current_customer.order_lists

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
