class Customers::ShippingAddressesController < ApplicationController
before_action :authenticate_customer!# ログインしているユーザーのみ入れる

def index
 @shipping_address = ShippingAddress.new
 @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id) #一覧表示
end


def create #投稿データの保存
 @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id) #一覧表示
 @shipping_address = ShippingAddress.new(shipping_address_params)
 @shipping_address.customer_id = current_customer.id
  if @shipping_address.save
  	flash[:notice] = "success!"
    redirect_to customers_shipping_addresses_path #成功
  else
  	render ("/customers/shipping_addresses/index") #失敗
  end
end

def destroy
 shipping_address = ShippingAddress.find(params[:id])
 shipping_address.destroy #削除
 redirect_to customers_shipping_addresses_path
end

def new
end

def edit
 @shipping_address = ShippingAddress.find(params[:id])
end

def update
 @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id) #一覧表示
 @shipping_address = ShippingAddress.find(params[:id])
 @shipping_address.update(shipping_address_params)
  if @shipping_address.save
  	flash[:notice] = "success!"
    redirect_to customers_shipping_addresses_path #成功
  else
  	render ("/customers/shipping_addresses/edit") #失敗
  end
end


 private

 def shipping_address_params
  	params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
 end
end
