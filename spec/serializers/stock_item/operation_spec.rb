require 'rails_helper'

describe StockItem::OperationSerializer do
  let(:operation) { create(:stock_item_operation) }

  let(:serializer) do
    described_class.new(operation)
  end

  subject(:json) do
    serializer.serializable_hash.dig(:data, :attributes)
  end

  describe 'attributes' do
    it { expect(json[:id]).to eq(operation.id) }
    it { expect(json[:amount]).to eq(operation.amount) }
    it { expect(json[:status]).to eq(I18n.t("activerecord.attributes.stock_item/operation.statuses.#{operation.status}")) }
  end
end
