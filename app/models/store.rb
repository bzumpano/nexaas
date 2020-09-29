class Store < ApplicationRecord

  # Associations

  has_many :stock_items


  # Validations

  validates_presence_of :name

  validates_uniqueness_of :name, case_sensitive: false
end
