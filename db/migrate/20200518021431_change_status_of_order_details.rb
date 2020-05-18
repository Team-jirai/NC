class ChangeStatusOfOrderDetails < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_details, :making_status, :integer, default:0, null:false, limit:1
  end
end
