class Product < ApplicationRecord
    belongs_to :product_genre
    belongs_to :customer #
    has_many :cart_products
    has_many :order_details
    enum sales_status:{sale:0, soldout:1}
    attachment :picture
    has_many :post_comments, dependent: :destroy #


    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :picture, presence: true
    validates :sales_status, presence: true

    def self.search(search, customer_or_product,how_search)

      if customer_or_product == '2'
          if how_search == "1"
             Product.where(['name LIKE ?', "%#{search}%"])
          elsif how_search == "2"
             Product.where(['name LIKE ?', "%#{search}"])
          elsif how_search == "3"
             Product.where(['name LIKE ?', "#{search}%"])
          elsif how_search == "4"
             Product.where(['name LIKE ?', "#{search}"])
          else
             Product.all
         end
      end
    end

    scope :only_active, -> {
      where(product_genre_id: ProductGenre.only_active)
#      where(product_genre_id: ProductGenre.only_active.select(:id))
    }

    def price_with_tax(price)
      (price * 1.1).to_i
    end

end
