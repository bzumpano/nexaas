class StockItems::AddInputWorker < StockItems::BaseWorker

  private

  def call
    return unless operation.input?

    operation.success!
    update_stock_item_amount
  end
end
