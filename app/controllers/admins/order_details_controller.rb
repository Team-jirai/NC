class Admins::OrderDetailsController < ApplicationController

	def update
		@order_detail = OrderDetail.find
		@order_detail.update
		redirect_to
	end

	private

	def order_list_params
		params.require(:order_detail).permit(:making_status)
	end

end

