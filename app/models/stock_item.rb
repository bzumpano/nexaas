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
end
