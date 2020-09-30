class StockItems::OutputsController < StockItems::BaseController

  private

  def worker_klass
    StockItems::AddOutputWorker
  end

  def build_resource
    stock_item.operations.output.new(resource_params)
  end
end
