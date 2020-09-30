class StockItems::OutputsController < ApplicationController
  PERMITTED_PARAMS = %i[
    amount
  ]

  private

  def resource_klass
    StockItem::Operation
  end

  def stock_item
    @stock_item ||= StockItem.find(params[:stock_item_id])
  end

  def build_resource
    stock_item.operations.output.new(resource_params)
  end
end
