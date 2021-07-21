class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order_id, null: false, foreign_key: true
      t.references :item_id, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
