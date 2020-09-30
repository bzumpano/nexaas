class StockItems::AddOutputWorker < StockItems::BaseWorker

  private

  def call
    return unless operation.output?

    available_amount? ? operation.success! : operation.insufficient_stock!
    update_stock_item_amount
  end

  def available_amount?
    stock_item.amount >= operation.amount
  end
end
