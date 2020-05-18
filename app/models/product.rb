class Product < ApplicationRecord
    belongs_to :product_genre
    has_many :cart_products
    has_many :order_details
    enum sales_status:{sale:0, soldout:1}
    attachment :picture

    def price_with_tax(price)
      (price * 1.1).to_i
    end
end
