class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :order_list_id
      t.integer :making_status
      t.integer :price
      t.integer :number

      t.timestamps
    end
  end
end
