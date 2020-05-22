class RemovePaymentMethodFromOrderLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_lists, :payment_method, :integer
  end
end
