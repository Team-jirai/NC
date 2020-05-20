class Customers::ProductGenresController < ApplicationController
	def show
		@products = Product.where(product_genre_id: params[:id])
	end
end
