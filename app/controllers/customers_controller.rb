class CustomersController < ApplicationController

	def mypage
		@user = current_customer
		
	end

	def edit
		@user = current_customer
	end

	def withdraw
		@user = current_customer
	end

	def update
		@user = current_customer
	end
end
