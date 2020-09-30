class StockItems::BaseController < ApplicationController
  PERMITTED_PARAMS = %i[
    amount
  ]

  after_action :call_worker, only: :create, if: -> { resource.persisted? }

  private

  def worker_klass
    raise NotImplementedError, <<~ERR
      #{self.class.name} has not defined the worker_klass resource method.
      Make sure to use ::worker_klass method on the class to configure it.
    ERR
  end

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
    worker_klass.perform_async(resource.id)
  end
end
