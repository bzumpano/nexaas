class StockItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :store_id, :product_id, :amount
end
