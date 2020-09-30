FactoryBot.define do
  factory :stock_item do
    product
    store
    amount { 0 }
  end
end
