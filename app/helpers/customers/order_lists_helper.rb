module Customers::OrderListsHelper
    def converting_to_jpy(price)
       "#{price.to_s(:delimited, delimiter: ',')}円"
	end
end
