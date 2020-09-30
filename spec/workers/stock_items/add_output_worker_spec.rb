require 'rails_helper'

RSpec.describe StockItems::AddOutputWorker, type: :worker do
  subject(:worker) { StockItems::AddOutputWorker.new }

  let(:input_amount) { 3 }
  let(:stock_item) do
    stock_item = create(:stock_item, amount: input_amount)
    create(:stock_item_operation, :input, :success, stock_item: stock_item, amount: input_amount)
    stock_item
  end

  let(:output_amount) { 1 }
  let(:operation) { create(:stock_item_operation, :output, stock_item: stock_item, amount: output_amount) }

  before { worker.perform(operation.id) }

  it { is_expected.to be_kind_of(Sidekiq::Worker) }

  describe 'when has amount available' do
    it { expect(operation.reload).to be_success }
    it { expect(stock_item.reload.amount).to eq(input_amount - output_amount) }
  end

  describe 'when hasn`t amount available' do
    let(:output_amount) { input_amount + 1 }

    it { expect(operation.reload).to be_insufficient_stock }
    it { expect(stock_item.reload.amount).to eq(input_amount) }
  end
end
