class ShippingAddress < ApplicationRecord
  belongs_to :customer

  #住所、郵便番号、宛名が空だとバリデーションかかる
  # validates :name, :postal_code, :address, prensence: true
end
