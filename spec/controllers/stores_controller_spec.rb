require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  describe 'POST #create' do
    let(:valid_params) do
      { store: attributes_for(:store) }
    end

    it 'permitted_params' do
      is_expected.to permit(*%i[name]).for(:create, params: valid_params).on(:store)
    end
  end

  describe 'PATCH #update' do
    let(:store) { create(:store) }

    let(:valid_params) do
      {
        id: store,
        store: attributes_for(:store)
      }
    end

    it 'permitted_params' do
      is_expected.to permit(*%i[name]).for(:update, params: valid_params).on(:store)
    end
  end
end
