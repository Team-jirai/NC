class ProductGenre < ApplicationRecord
	has_many :products
	enum is_valid:{effectiveness:true, uneffectiveness:false}
	# validates :is_valid, inclusion: {in: ["effectiveness", "uneffectiveness"]}
end
