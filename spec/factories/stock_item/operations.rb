FactoryBot.define do
  factory :stock_item_operation, class: 'StockItem::Operation' do
    stock_item
    operation_type { :input }
    amount { 1 }
  end
end
