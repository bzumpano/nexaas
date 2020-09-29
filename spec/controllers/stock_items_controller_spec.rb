require 'rails_helper'

RSpec.describe StockItemsController, type: :controller do
  describe 'POST #create' do
    let(:valid_params) do
      { stock_item: create(:stock_item).attributes }
    end

    it 'permitted_params' do
      is_expected.to permit(*%i[store_id product_id amount]).for(:create, params: valid_params).on(:stock_item)
    end
  end
end
