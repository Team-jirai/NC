class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products
  has_many :order_lists
  has_many :shipping_addresses
  has_many :products, dependent: :destroy #
  has_many :post_comments, dependent: :destroy #1対Nの関係
  def active_for_authentication?
    super && (self.status == true)
  end
end
