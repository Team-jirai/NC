class Product < ApplicationRecord
    belongs_to :product_gunre
    has_many :cart_products
    has_many :order_details
end
