class PostComment < ApplicationRecord
 belongs_to :customer
 belongs_to :product

  validates :comment, presence: true

end
