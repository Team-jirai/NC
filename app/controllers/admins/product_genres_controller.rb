class Admins::ProductGunresController < ApplicationController

	def index
		@genres = ProductGenre.all
		@newgenre = ProductGenre.new
	end

	def edit
	end

	def create
	end

	def update
	end
	
end
