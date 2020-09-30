FactoryBot.define do
  factory :stock_item_operation, class: 'StockItem::Operation' do
    stock_item
    amount { 1 }
    input
    pending

    trait :input do
      operation_type { :input }
    end

    trait :output do
      operation_type { :output }
    end

    trait :pending do
      status { :pending }
    end

    trait :success do
      status { :success }
    end

    trait :insufficient_stock do
      status { :insufficient_stock }
    end
  end
end
