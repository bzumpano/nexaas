require 'rails_helper'

RSpec.describe "StockItems::Operations", type: :request do
  let(:stock_item) { create(:stock_item) }

  describe 'POST #create' do
    context 'valid' do
      let(:valid_params) do
        { operation: attributes_for(:stock_item_operation) }
      end

      context 'returns http :created' do
        before { post(stock_item_operations_path(stock_item), params: valid_params) }

        it { expect(response).to have_http_status(:created) }
      end

      it 'create operation' do
        valid_params

        expect do
          post(stock_item_operations_path(stock_item), params: valid_params)
        end.to change(StockItem, :count).by(1)
      end

      context 'associate to stock_item' do
        let(:created_operation) { StockItem::Operation.last }

        before { post(stock_item_operations_path(stock_item), params: valid_params) }

        it { expect(created_operation.stock_item).to eq(stock_item) }
      end
    end

    context 'invalid' do
      let(:invalid_params) do
        { operation: attributes_for(:stock_item_operation, amount: nil) }
      end

      before { post(stock_item_operations_path(stock_item), params: invalid_params) }

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end
end
