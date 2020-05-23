class Admins::OrderListsController < ApplicationController

	before_action :authenticate_admin!

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
		if @order_list.status == "paymentok"
			@order_list.order_details.each do |order_detail|
				order_detail.update_attributes(making_status: "waitmaking")
			end
		end
		redirect_back(fallback_location: root_path)
	end

	private

	def order_list_params
		params.require(:order_list).permit(:status)
	end

end
