class StockItems::AddInputWorker
  include Sidekiq::Worker

  attr_accessor :operation

  def perform(operation_id)
    @operation = StockItem::Operation.find(operation_id)
    return unless operation.input?

    call
  end

  private

  def call
    operation.success!
    update_stock_item_amount
  end

  def stock_item
    @stock_item ||= operation.stock_item
  end

  def update_stock_item_amount
    stock_item.update(amount: StockItem::Operation.success.where(stock_item_id: stock_item).sum(:signed_amount))
  end
end
