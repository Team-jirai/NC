class Customers::ProductsController < ApplicationController

def top
 @products = Product.page(params[:page]).per(4)
 @genres = ProductGenre.all
 # @customer = Current_user
end

def about
end

def index
 @product = Product.new
 @products = Product.page(params[:page]).per(8)
 @genres = ProductGenre.all
end

def show
 @product = Product.find(params[:id])
 @product_new = CartProduct.new #formforで使うための空のモデル(空の箱),CartProductのコントローラーに送る。
 @genres = ProductGenre.all
 @post_comment = PostComment.new #商品へのコメント
end

def create
end


  private

  def product_params
  	params.require(:product).permit(:product_genre_id, :name, :description, :price, :picture_id, :sales_status, :customer_id)
  end

end
