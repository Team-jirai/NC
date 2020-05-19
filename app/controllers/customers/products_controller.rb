class Customers::ProductsController < ApplicationController

def top
 @products = Product.page(params[:page]).per(4)
end

def index
 @product = Product.new
 @products = Product.page(params[:page]).per(8)

end

def show
 @product = Product.find(params[:id])
 product = Product.new
 @cart_product = CartProduct.new #追加
end

def create
end


  private

  def product_params
  	params.require(:product).permit(:product_genre_id, :name, :description, :price, :picture_id, :sales_status)
  end

end
