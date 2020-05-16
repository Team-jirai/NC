class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_genre_id
      t.string :name
      t.text :description
      t.integer :price
      t.text :picture_id
      t.integer :sales_status

      t.timestamps
    end
  end
end
