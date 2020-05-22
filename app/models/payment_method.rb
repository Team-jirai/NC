class PaymentMethod < ApplicationRecord
	validates :method, presence: true
	validates :status, presence: true
end
