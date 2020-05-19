class OrderList < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum status:{waitingpayment:0, paymentok:1, making:2, preparation:3, finishshipping:4}

  def sum_price
  	total_price + postage
  end

end
