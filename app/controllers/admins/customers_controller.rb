class Admins::CustomersController < ApplicationController

	before_action :authenticate_admin!

	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to admins_customer_path(@customer.id)
		else
			render :edit
		end
	end

	private

	def customer_params
		params.require(:customer).permit(:name_sei, :name_mei, :yomi_sei, :yomi_mei, :postal_code, :address, :tell, :email, :status)
	end

end
