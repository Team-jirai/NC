class AddPaymentMethodToOrderLists < ActiveRecord::Migration[5.2]
  def change
    add_column :order_lists, :payment_method, :string
  end
end
