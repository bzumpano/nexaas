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
end
