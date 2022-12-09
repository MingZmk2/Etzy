class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name, null:false
      t.integer :seller_id, null:false
      t.decimal :price, null:false, precision:10, scale: 2
      t.text :description, null:false
      t.integer :category_id, null:false
      t.timestamps
    end
    add_index :products, :seller_id
    add_index :products, :category_id
    add_index :products, :product_name
  end
end