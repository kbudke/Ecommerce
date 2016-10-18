class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :line_item_total
      t.integer :order_id

      t.timestamps
    end
  end
end
