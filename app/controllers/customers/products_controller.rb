class Customers::ProductsController < ApplicationController

def top
 @products = Product.page(params[:page]).per(4)
end

def index
 @product = Product.new
 @products = Product.page(params[:page]).per(8)
 @genres = ProductGenre.all
end

def show
 @product = Product.find(params[:id])
 @product_new = CartProduct.new #formforで使うための空のモデル(空の箱),CartProductのコントローラーに送る。
end

def create
end


  private

  def product_params
  	params.require(:product).permit(:product_genre_id, :name, :description, :price, :picture_id, :sales_status)
  end

end
