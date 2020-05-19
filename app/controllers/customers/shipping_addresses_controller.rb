class Customers::ShippingAddressesController < ApplicationController

def index
 @shipping_address = ShippingAddress.new
 @shipping_addresses = ShippingAddress.all #一覧表示
end


def create #投稿データの保存
 @shipping_address = ShippingAddress.new(shipping_address_params)
 @shipping_address.customer_id = current_customer.id
 @shipping_address.save!
 redirect_to customers_shipping_addresses_path
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
 @shipping_address = ShippingAddress.find(params[:id])
 @shipping_address.update(shipping_address_params)
 redirect_to customers_shipping_addresses_path(current_customer)
end



 private

 def shipping_address_params
  	params.require(:shipping_address).permit(:customer_id, :name, :postal_code, :address)
 end
end
