require 'rails_helper'

RSpec.describe "StockItems::Outputs", type: :request do
  let(:stock_item) { create(:stock_item) }

  describe 'POST #create' do
    context 'valid' do
      let(:valid_params) do
        { output: attributes_for(:stock_item_operation) }
      end

      context 'returns http :created' do
        before { post(stock_item_outputs_path(stock_item), params: valid_params) }

        it { expect(response).to have_http_status(:created) }
      end

      it 'create operation' do
        valid_params

        expect do
          post(stock_item_outputs_path(stock_item), params: valid_params)
        end.to change(StockItem, :count).by(1)
      end

      context 'associate to stock_item' do
        let(:created_operation) { StockItem::Operation.last }

        before { post(stock_item_outputs_path(stock_item), params: valid_params) }

        it { expect(created_operation.stock_item).to eq(stock_item) }
      end
    end

    context 'invalid' do
      let(:invalid_params) do
        { output: attributes_for(:stock_item_operation, amount: nil) }
      end

      before { post(stock_item_outputs_path(stock_item), params: invalid_params) }

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'GET #show' do
    let(:stock_item_operation) { create(:stock_item_operation, :output) }

    context 'valid' do
      before { get(stock_item_output_path(stock_item, stock_item_operation)) }

      it 'returns http :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns product' do
        expect(JSON.parse(response.body)).to eq(YAML.load(stock_item_operation.to_json))
      end
    end

    context 'invalid' do
      before { get(stock_item_output_path(0, 0)) }

      context 'returns http :not_found' do
        it { expect(response).to have_http_status(:not_found) }
      end
    end
  end
end
