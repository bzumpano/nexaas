class StockItems::BaseWorker
  include Sidekiq::Worker

  attr_accessor :operation

  def perform(operation_id)
    @operation = StockItem::Operation.find(operation_id)

    call
  end

  private

  def call
    raise NotImplementedError, <<~ERR
      #{self.class.name} has not defined the call resource method.
      Make sure to use ::call method on the class to configure it.
    ERR
  end

  def stock_item
    @stock_item ||= operation.stock_item
  end

  def update_stock_item_amount
    stock_item.update(amount: StockItem::Operation.success.where(stock_item_id: stock_item).sum(:signed_amount))
  end
end
