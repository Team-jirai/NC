class Customers::ProductGenresController < ApplicationController
	def show
		@products = Product.where(product_genre_id: params[:id])
		@genres = ProductGenre.all
		@genre = ProductGenre.find(params[:id])
	end
end
