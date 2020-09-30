class StockItems::AddOutputWorker
  include Sidekiq::Worker

  attr_accessor :operation

  def perform(operation_id)
    @operation = StockItem::Operation.find(operation_id)
    return unless operation.output?

    call
  end

  private

  def call
    available_amount? ? operation.success! : operation.insufficient_stock!
    update_stock_item_amount
  end

  def stock_item
    @stock_item ||= operation.stock_item
  end

  def available_amount?
    stock_item.amount >= operation.amount
  end

  def stock_item_net_amount
    stock_item.operations.success.sum(:signed_amount)
  end

  def update_stock_item_amount
    stock_item.update(amount: StockItem::Operation.success.where(stock_item_id: stock_item).sum(:signed_amount))
  end
end
