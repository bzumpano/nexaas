require 'rails_helper'

RSpec.describe "Stores", type: :request do
  describe 'POST #create' do
    context 'valid' do
      let(:valid_params) do
        { store: attributes_for(:store) }
      end

      context 'returns http :ok' do
        before { post(stores_path, params: valid_params) }

        it { expect(response).to have_http_status(:created) }
      end

      it 'create store' do
        expect do
          post(stores_path, params: valid_params)
        end.to change(Store, :count).by(1)
      end
    end

    context 'invalid' do
      let(:invalid_params) do
        { store: attributes_for(:store, name: nil) }
      end

      before { post(stores_path, params: invalid_params) }

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'PATCH #update' do
    let(:store) { create(:store) }

    context 'valid' do
      let(:updated_name) { 'Name updated' }
      let(:valid_params) do
        { store: attributes_for(:store, name: updated_name) }
      end

      before { patch(store_path(store), params: valid_params) }

      it 'returns http :ok' do
        patch(store_path(store), params: valid_params)
        expect(response).to have_http_status(:ok)
      end

      it 'update store' do
        expect(store.reload.name).to eq(updated_name)
      end
    end

    context 'invalid' do
      let(:invalid_params) do
        { store: attributes_for(:store, name: nil) }
      end

      before { patch(store_path(store), params: invalid_params) }

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:store) { create(:store) }

    context 'valid' do
      it 'returns http :ok' do
        delete(store_path(store))
        expect(response).to have_http_status(:ok)
      end

      it 'remove store' do
        store

        expect do
          delete(store_path(store))
        end.to change(Store, :count).by(-1)
      end
    end

    context 'invalid' do
      before do
        allow_any_instance_of(Store).to receive(:destroy!).and_raise(ActiveRecord::RecordNotDestroyed)

        delete(store_path(store))
      end

      context 'returns http :unprocessable_entity' do
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  describe 'GET #show' do
    let(:store) { create(:store) }

    context 'valid' do
      before { get(store_path(store)) }

      it 'returns http :ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns store' do
        expect(JSON.parse(response.body)).to eq(YAML.load(store.to_json))
      end
    end

    context 'invalid' do
      before { get(store_path(0)) }

      context 'returns http :not_found' do
        it { expect(response).to have_http_status(:not_found) }
      end
    end
  end
end
