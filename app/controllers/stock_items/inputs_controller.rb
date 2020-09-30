class StockItems::InputsController < ApplicationController
  PERMITTED_PARAMS = %i[
    amount
  ]

  after_action :call_worker, only: :create, if: -> { resource.persisted? }

  private

  def resource_klass
    StockItem::Operation
  end

  def stock_item
    @stock_item ||= StockItem.find(params[:stock_item_id])
  end

  def build_resource
    stock_item.operations.input.new(resource_params)
  end

  def call_worker
    StockItems::AddInputWorker.perform_async(resource.id)
  end
end
