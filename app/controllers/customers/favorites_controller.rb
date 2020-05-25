class Customers::FavoritesController < ApplicationController

    before_action :authenticate_customer!

	def create
        @product = Product.find(params[:product_id])
        @favorite = Favorite.new(product_id: @product.id)
        @favorite.customer_id = current_customer.id
        @favorite.save
        redirect_back(fallback_location: root_path)
        end

    def destroy
        @product = Product.find(params[:product_id])
        @favorite = Favorite.find_by(product_id: @product.id)
        @favorite.customer_id = current_customer.id
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end

end
