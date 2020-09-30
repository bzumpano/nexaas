require 'rails_helper'

describe ProductSerializer do
  let(:product) { create(:product) }

  let(:serializer) do
    described_class.new(product)
  end

  subject(:json) do
    serializer.serializable_hash.dig(:data, :attributes)
  end

  describe 'attributes' do
    it { expect(json[:id]).to eq(product.id) }
    it { expect(json[:name]).to eq(product.name) }
    it { expect(json[:price]).to eq(product.price.to_s) }
  end
end
