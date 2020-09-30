class StockItem < ApplicationRecord

  # Associations

  belongs_to :product
  belongs_to :store

  has_many :operations


  #  Validations

  validates :product,
    :store,
    :amount,
    presence: true

  validates_numericality_of :amount, greater_than_or_equal_to: 0
end
