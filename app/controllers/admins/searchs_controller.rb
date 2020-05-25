class Admins::SearchsController < ApplicationController
	def search
		@customer_or_product = params[:option]
		@how_search = params[:choice]
		if @customer_or_product == "1"
		    @customers = Customer.search(params[:search], @customer_or_product, @how_search)
	    elsif @customer_or_product == "2"
  		    @products = Product.search(params[:search], @customer_or_product, @how_search)
  		end
  	end
end
