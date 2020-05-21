class ShippingAddress < ApplicationRecord
  belongs_to :customer

  def full_address # orderlistで使用（住所結合表示のため）
    postal_code + " " + address + " " + name
  end
end
