class Admins::ProductGenresController < ApplicationController

	before_action :authenticate_admin!

	def index
		@genres = ProductGenre.all
		@newgenre = ProductGenre.new
	end

	def create
		@newgenre = ProductGenre.new(genre_params)
		if @newgenre.save
			redirect_to admins_product_genres_path
		else
			@genres = ProductGenre.all
			render :index
		end
	end

	def edit
		@genre = ProductGenre.find(params[:id])
	end

	def update
		@genre = ProductGenre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to admins_product_genres_path
		else
			render :edit
		end
	end

	private
	def genre_params
		params.require(:product_genre).permit(:genre, :is_valid)
	end


end
