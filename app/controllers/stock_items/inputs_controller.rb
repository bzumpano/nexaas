class StockItems::InputsController < StockItems::BaseController

  private

  def worker_klass
    StockItems::AddInputWorker
  end

  def build_resource
    stock_item.operations.input.new(resource_params)
  end
end
