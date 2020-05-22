class Postage < ApplicationRecord
	validates :cost, presence: true
end
