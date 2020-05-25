class PaymentMethod < ApplicationRecord
	validates :method, presence: true
	validates :status, inclusion: {in: [true, false]}
end
