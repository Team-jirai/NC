class Customers::ProductGenresController < ApplicationController
	def show
		@products = Product.where(params[:id])
	end
end
