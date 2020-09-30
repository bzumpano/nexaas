require 'rails_helper'

describe StockItemSerializer do
  let(:stock_item) { create(:stock_item) }

  let(:serializer) do
    described_class.new(stock_item)
  end

  subject(:json) do
    serializer.serializable_hash.dig(:data, :attributes)
  end

  describe 'attributes' do
    it { expect(json[:id]).to eq(stock_item.id) }
    it { expect(json[:store_id]).to eq(stock_item.store_id) }
    it { expect(json[:product_id]).to eq(stock_item.product_id) }
    it { expect(json[:amount]).to eq(stock_item.amount) }
  end
end
