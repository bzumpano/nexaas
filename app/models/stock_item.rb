class StockItem < ApplicationRecord

  # Associations

  belongs_to :product
  belongs_to :store


  #  Validations

  validates :product,
    :store,
    :amount,
    presence: true
end
