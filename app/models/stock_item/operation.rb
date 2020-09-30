class StockItem::Operation < ApplicationRecord

  # Enums

  enum status: %i[
    pending
    success
    insufficient_stock
  ]

  enum operation_type: %i[
    input
    output
  ]

  # Associations

  belongs_to :stock_item


  # Validations

  validates_presence_of :stock_item,
    :operation_type,
    :amount


  validates_numericality_of :amount, greater_than: 0
end
