class StockItem::WriteOff < ApplicationRecord

  # Associations

  belongs_to :stock_item


  # Validations

  validates_presence_of :stock_item, :amount
end
