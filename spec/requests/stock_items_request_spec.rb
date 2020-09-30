require 'rails_helper'

RSpec.describe "StockItems", type: :request do
  describe 'POST #create' do
    context 'valid' do
      let(:valid_params) do
        { stock_item: create(:stock_item).attributes }
      end

      context 'returns http :created' do
        before { post(stock_items_path, params: valid_params) }

        it { expect(response).to have_http_status(:created) }
      end

      it 'create stock_item' do
        valid_params

        expect do
          post(stock_items_path, params: valid_params)
        end.to change(StockItem, :count).by(1)
      end
    end

    context 'invalid' do
      let(:invalid_params) do
        { stock_item: attributes_for(:stock_item, name: nil) }
      end

      before { post(stock_items_path, params: invalid_params) }

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'GET #show' do
    let(:stock_item) { create(:stock_item) }

    context 'valid' do
      before { get(stock_item_path(stock_item)) }

      it 'returns http :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns stock_item' do
        expect(JSON.parse(response.body).symbolize_keys).to eq(StockItemSerializer.new(stock_item).serializable_hash.dig(:data, :attributes))
      end
    end

    context 'invalid' do
      before { get(stock_item_path(0)) }

      context 'returns http :not_found' do
        it { expect(response).to have_http_status(:not_found) }
      end
    end
  end
end
