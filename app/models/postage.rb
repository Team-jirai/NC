class Postage < ApplicationRecord
	belongs_to :order_list, optional: true

	validates :cost, presence: true
end
