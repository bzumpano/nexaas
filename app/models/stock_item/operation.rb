class StockItem::Operation < ApplicationRecord

  # Callbacks

  before_create :set_signed_amount

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

  private

  def set_signed_amount
    self.signed_amount = output? ? amount * -1 : amount
  end
end
