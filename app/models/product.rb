class Product < ApplicationRecord

  #  Validations

  validates :name,
    :price,
    presence: true

  validates_uniqueness_of :name, case_sensitive: false
end
