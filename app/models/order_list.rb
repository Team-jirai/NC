class OrderList < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum status:{waitingpayment:0, paymentok:1, making:2, preparation:3, finishshipping:4}
  # enum status:{"入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4}
  enum payment_method:{クレジットカード:0, 銀行振込:1}
  # enum status:{クレジットカード:0, 銀行振込:1}


  def sum_price
  	total_price + postage
  end

end
