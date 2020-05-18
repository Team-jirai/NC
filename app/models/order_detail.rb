class OrderDetail < ApplicationRecord
    belongs_to :order_detail
    belongs_to :product
    enum making_status:{cannotmaking:0, waitmaking:1, nowmaking:2, finishmaking:3}
end
