class Customers::ProductsController < ApplicationController

def top
end

def index
 @product = Product.new
 @products = Product.all
end

def show
 @product = Product.find(params[:id])
 product = Product.new
end

end
