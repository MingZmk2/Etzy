class ChangeProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :category_id
    add_column :products, :availability, :integer, null: false
  end
end
