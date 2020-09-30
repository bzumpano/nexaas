class CreateStockItems < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_items do |t|
      t.references :product, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
