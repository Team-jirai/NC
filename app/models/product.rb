class Product < ApplicationRecord
    belongs_to :product_genre
    has_many :cart_products
    has_many :order_details
    enum sales_status:{sale:0, soldout:1}
    attachment :picture

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :picture, presence: true
    validates :sales_status, presence: true

    scope :only_active, -> {
      where(product_genre_id: ProductGenre.only_active)
#      where(product_genre_id: ProductGenre.only_active.select(:id))
    }

    def price_with_tax(price)
      (price * 1.1).to_i
    end

end
