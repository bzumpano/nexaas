class StockItem::OperationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :amount

  attribute :status do |operation|
    I18n.t("activerecord.attributes.stock_item/operation.statuses.#{operation.status}")
  end
end
