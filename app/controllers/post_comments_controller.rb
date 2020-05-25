class PostCommentsController < ApplicationController

 def create
   product = Product.find(params[:product_id])
   comment = current_user.post_comments.new(post_comment_params)
   comment.save
   redirect_to product_path(product)
 end

 private
 def post_comment_params
 	params.require(:post_comment).permit(:comment)
end
