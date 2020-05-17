class Admins::OrderListsController < ApplicationController
	
	def top
		@order_lists = OrderList.where("created_at >= ?", Time.zone.now.beginning_of_day)
	end

	def index
		@order_lists = OrderList.all
	end

	def show
	end

	def update
	end

end
