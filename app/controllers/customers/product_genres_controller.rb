class Customers::ProductGenresController < ApplicationController
	def show
		@products = Product.where(product_genre_id: params[:id]).page(params[:page]).per(8)
		@genres = ProductGenre.where(is_valid: true)
		@genre = ProductGenre.find(params[:id])
	end
end
