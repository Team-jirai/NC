class ProductGenre < ApplicationRecord
	has_many :products
	# enum is_valid:{effectiveness:true, uneffectiveness:false}

	validates :genre, presence: true
	validates :is_valid, presence: true

	scope :only_active, -> { where(is_valid: true) }
end
