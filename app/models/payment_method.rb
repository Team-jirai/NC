class PaymentMethod < ApplicationRecord
	belongs_to :order_list, optional: true

	validates :method, presence: true
	validates :status, presence: true
end
