class RenamePostageColumnToOrderLists < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_lists, :postage, :shipping_fee
  end
end
