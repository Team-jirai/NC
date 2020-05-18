class ChangeStatusOfOrderLists < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_lists, :status, :integer, default:0, null:false, limit:1
  end
end
