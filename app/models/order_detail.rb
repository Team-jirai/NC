class OrderDetail < ApplicationRecord
    belongs_to :order_list
    belongs_to :product
    enum making_status:{cannotmaking:0, waitmaking:1, nowmaking:2, finishmaking:3}

    def sum_price
    	price * number
    end

end
