class Admins::OrderDetailsController < ApplicationController

	before_action :authenticate_admin!

	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_details = OrderDetail.where(order_list_id: @order_detail.order_list_id)
		@order_list = OrderList.find(@order_detail.order_list_id)
		@order_detail.update(order_detail_params)
		if @order_detail.making_status == "nowmaking"
			@order_list.update_attributes(status: "making")
		end
		#以下、制作ステータスが全て「制作完了」になったら、注文ステータスを自動で「配送待ち」にする。
		 i = 0
		@order_details.each do |s| #注文詳細の数とiの数が同じになったら「発送待ち」にアップデートされる。
			if s.making_status != "finishmaking"
				break
			else
				i += 1
				if i == @order_details.count
					@order_list.update_attributes(status: "preparation")
				end
			end
		end

		redirect_back(fallback_location: root_path)
	end

	private

	def order_detail_params
		params.require(:order_detail).permit(:making_status, :order_list_id)
	end

end

