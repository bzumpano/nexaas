require 'rails_helper'

describe StoreSerializer do
  let(:store) { create(:store) }

  let(:serializer) do
    described_class.new(store)
  end

  subject(:json) do
    serializer.serializable_hash.dig(:data, :attributes)
  end

  describe 'attributes' do
    it { expect(json[:id]).to eq(store.id) }
    it { expect(json[:name]).to eq(store.name) }
  end
end
