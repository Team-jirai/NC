class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

protected
def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_sei, :name_mei, :yomi_sei, :yomi_mei, :postal_code, :address, :tell, :email ])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
 end

end
