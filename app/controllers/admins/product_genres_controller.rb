
class ProductGenresController < ApplicationController

class Admins::ProductGenresController < ApplicationController

	def index
		@genres = ProductGenre.all
		@newgenre = ProductGenre.new
	end

	def create
		@newgenre = ProductGenre.new(genre_params)
		@newgenre.save
		redirect_to admins_product_genres_path
	end

	def edit
		@genre = ProductGenre.find(params[:id])
	end

	def update
		@genre = ProductGenre.find(params[:id])
		@genre.update(genre_params)
		redirect_to admins_product_genres_path
	end

	private
	def genre_params
		params.require(:product_genre).permit(:genre, :is_valid)
	end


end
