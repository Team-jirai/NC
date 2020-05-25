class Customers::PostCommentsController < ApplicationController
 before_action :authenticate_customer!# ログインしているユーザーのみ入れる
 #before_action :authenticate_admin!

 def create
   @product = Product.find(params[:product_id])
   @post_comment = current_customer.post_comments.new(post_comment_params)
   @post_comment.product_id = @product.id
  if @post_comment.save
  	flash[:notice] = "success!"
    redirect_to request.referer#成功
  else
  	@product_new = CartProduct.new #formforで使うための空のモデル(空の箱),CartProductのコントローラーに送る。
    @genres = ProductGenre.only_active
  	render 'customers/products/show' #失敗
  end
 end



 def destroy
   comment = PostComment.find(params[:id])
   comment.destroy
   redirect_back(fallback_location: root_path)
 end


 private
 def post_comment_params
 	params.require(:post_comment).permit(:comment)
 end
end

