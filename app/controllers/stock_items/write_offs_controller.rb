class StockItems::WriteOffsController < ApplicationController
  PERMITTED_PARAMS = %i[
    amount
  ]

  private

  def resource_klass
    StockItem::WriteOff
  end

  def stock_item
    @stock_item ||= StockItem.find(params[:stock_item_id])
  end

  def build_resource
    stock_item.write_offs.new(resource_params)
  end
end
