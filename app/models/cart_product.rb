class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  validates :number, presence: true

  number = [['1',1],['2',2],['3',3],['4',4],['5',5],['6',6],['7',7],['8',8],['9',9],['10',10]]

end

