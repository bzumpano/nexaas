class Product < ApplicationRecord

  #  Validations

  validates :name,
    :price,
    presence: true
end
