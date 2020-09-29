FactoryBot.define do
  factory :stock_item_write_off, class: 'StockItem::WriteOff' do
    stock_item
    amount { 1 }
  end
end
