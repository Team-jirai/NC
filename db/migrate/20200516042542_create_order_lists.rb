class CreateOrderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lists do |t|
      t.integer :postage
      t.integer :customer_id
      t.integer :total_price
      t.integer :status
      t.integer :payment_method
      t.string :shipping_name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
