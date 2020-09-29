require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'POST #create' do
    let(:valid_params) do
      { product: attributes_for(:product) }
    end

    it 'permitted_params' do
      is_expected.to permit(*%i[name price]).for(:create, params: valid_params).on(:product)
    end
  end

  describe 'PATCH #update' do
    let(:product) { create(:product) }

    let(:valid_params) do
      {
        id: product,
        product: attributes_for(:product)
      }
    end

    it 'permitted_params' do
      is_expected.to permit(*%i[name price]).for(:update, params: valid_params).on(:product)
    end
  end
end
