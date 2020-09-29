require 'rails_helper'

RSpec.describe 'Products', type: :request do

  describe 'POST #create' do
    context 'valid' do
      let(:valid_params) do
        { product: attributes_for(:product) }
      end

      before { post(products_path, params: valid_params) }

      context 'returns http :ok' do
        it { expect(response).to have_http_status(:created) }
      end

      it 'create product' do
        expect do
          post(products_path, params: valid_params)
        end.to change(Product, :count).by(1)
      end
    end

    context 'invalid' do
      let(:invalid_params) do
        { product: attributes_for(:product, name: nil) }
      end

      before { post(products_path, params: invalid_params) }

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'PATCH #update' do
    let(:product) { create(:product) }

    context 'valid' do
      let(:updated_name) { 'Name updated' }
      let(:valid_params) do
        { product: attributes_for(:product, name: updated_name) }
      end

      before { patch(product_path(product), params: valid_params) }

      it 'returns http :ok' do
        patch(product_path(product), params: valid_params)
        expect(response).to have_http_status(:ok)
      end

      it 'update product' do
        expect(product.reload.name).to eq(updated_name)
      end
    end

    context 'invalid' do
      let(:invalid_params) do
        { product: attributes_for(:product, name: nil) }
      end

      before { patch(product_path(product), params: invalid_params) }

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:product) { create(:product) }

    context 'valid' do
      it 'returns http :ok' do
        delete(product_path(product))
        expect(response).to have_http_status(:ok)
      end

      it 'remove product' do
        product

        expect do
          delete(product_path(product))
        end.to change(Product, :count).by(-1)
      end
    end

    context 'invalid' do
      before do
        allow_any_instance_of(Product).to receive(:destroy!).and_raise(ActiveRecord::RecordNotDestroyed)

        delete(product_path(product))
      end

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'GET #show' do
    let(:product) { create(:product) }

    context 'valid' do
      before { get(product_path(product)) }

      it 'returns http :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns product' do
        expect(JSON.parse(response.body)).to eq(YAML.load(product.to_json))
      end
    end

    context 'invalid' do
      before { get(product_path(0)) }

      context 'returns http :not_found' do
        it { expect(response).to have_http_status(:not_found) }
      end
    end
  end
end
