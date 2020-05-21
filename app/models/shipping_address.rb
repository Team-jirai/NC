class ShippingAddress < ApplicationRecord
  belongs_to :customer


  #住所、郵便番号、宛名が空だとバリデーションかかる
  validates :name, :postal_code, :address, presence: true

  def full_address # orderlistで使用（住所結合表示のため）
    postal_code + " " + address + " " + name
  end

end
