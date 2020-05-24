class Customers::ProductsController < ApplicationController

def top
 @products = Product.page(params[:page]).per(4)
 @genres = ProductGenre.only_active
end

def about
end

def index
 @product = Product.new
 @products = Product.only_active.page(params[:page]).per(8)
#@products = []

# Product.all.each do |product|
#	if product.product_genre.is_valid #== true
#	 	@products << product
#	end
#end

 @genres = ProductGenre.only_active
end

def show
 @product = Product.find(params[:id])
 @product_new = CartProduct.new #formforで使うための空のモデル(空の箱),CartProductのコントローラーに送る。
 @genres = ProductGenre.only_active

end

def create
end


  private

  def product_params
  	params.require(:product).permit(:product_genre_id, :name, :description, :price, :picture_id, :sales_status)
  end

end
