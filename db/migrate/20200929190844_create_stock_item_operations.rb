class CreateStockItemOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_item_operations do |t|
      t.references :stock_item, foreign_key: true
      t.integer :operation_type
      t.integer :status, default: 0
      t.integer :signed_amount
      t.integer :amount

      t.timestamps
    end
  end
end
