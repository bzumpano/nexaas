FactoryBot.define do
  factory :stock_item do
    product
    store
    amount { 1 }
  end
end
