require 'rails_helper'

RSpec.describe StockItems::AddInputWorker, type: :worker do
  subject(:worker) { StockItems::AddInputWorker.new }

  let(:input_amount) { 3 }
  let(:stock_item) do
    stock_item = create(:stock_item, amount: 0)
    stock_item
  end

  let(:output_amount) { 1 }
  let(:operation) { create(:stock_item_operation, :input, stock_item: stock_item, amount: input_amount) }

  before do
    create(:stock_item_operation, :output, :success, stock_item: stock_item, amount: output_amount)
    worker.perform(operation.id)
  end

  it { is_expected.to be_kind_of(Sidekiq::Worker) }
  it { expect(operation.reload).to be_success }
  it { expect(stock_item.reload.amount).to eq(input_amount - output_amount) }
end
