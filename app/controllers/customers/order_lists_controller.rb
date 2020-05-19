class Customers::OrderListsController < ApplicationController

  def index #注文履歴一覧
    @order_list = OrderList.new
    @order_lists = OrderList.where(customer_id: current_customer.id) #ログインしているユーザーの注文履歴のみ表示
  end

  def show #注文履歴詳細
    @order_list = OrderList.find(params[:id])
    @order_lists = OrderList.where(customer_id: current_customer.id)
  end

  def input

  end

  def confirm
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
