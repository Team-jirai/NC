class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name_sei, :name_mei, :yomi_sei, :yomi_mei, :postal_code, :address, :tell, :email ])
    	#sign_upの際にnameのデータ操作を許。追加したカラム。
	end

	def total_price
		@total_price = 0 #値を初期化している
     		current_customer.cart_products.each do |cart_product| # ログインしたユーザーに結びついているカート商品
       	@total_price = @total_price + cart_product.number * cart_product.product.price # 省略型：@total_price += cart_product.number * cart_product.product.price
    	end
    	@total_price = (@total_price * 1.1).floor # 四捨五入,@total_priceが最終型
	end
end
