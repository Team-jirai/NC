class Customers::OrderListsController < ApplicationController

  def index #注文履歴一覧
    @order_list = OrderList.new
    @order_lists = OrderList.all
  end

  def show
  end

  def input
  	@order_list = OrderList.new
  end

  def confirm
  end

  def thanks
  end

  def create
  end
end
