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

  def total_cart_price #モデルから
    total_price = 0 #値を初期化している
    self.cart_products.each do |cart_product| # ログインしたユーザーに結びついているカート商品
      total_price = total_price + cart_product.number * cart_product.product.price # 省略型：@total_price += cart_product.number * cart_product.product.price
    end
    total_price = (total_price * 1.1).floor # 四捨五入,@total_priceが最終型
  end


end
