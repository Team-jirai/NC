class Product < ApplicationRecord
    belongs_to :product_genre
    has_many :cart_products
    has_many :order_details
    enum sales_status:{sale:0, recommend:1, soldout:2}
    attachment :picture
    has_many :post_comments, dependent: :destroy #
    has_many :favorites, dependent: :destroy


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

    def favorited_by?(customer)
        favorites.where(customer_id: customer.id).exists?
    end

end
