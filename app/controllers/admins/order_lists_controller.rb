class Admins::OrderListsController < ApplicationController

	def top
		@order_lists = OrderList.where("created_at >= ?", Time.zone.now.beginning_of_day)
	end

	def index
		@order_lists = OrderList.all
	end

	def show
		@order_list = OrderList.find(params[:id])
	end

	def update
		@order_list = OrderList.find(params[:id])
		@order_list.update(order_list_params)
	end

	private

	def order_list_params
		params.require(:order_list).permit(:status)
	end

end
