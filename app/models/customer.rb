class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products
  has_many :order_lists
  has_many :shipping_addresses
  def active_for_authentication?
    super && (self.status == true)
  end
  # validates :status, inclusion: {in: ["effective", "uneffective"]}
end
