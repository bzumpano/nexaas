class CreateStockItemWriteOffs < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_item_write_offs do |t|
      t.references :stock_item, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
