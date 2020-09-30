require 'rails_helper'

RSpec.describe StockItems::OutputsController, type: :controller do
  let(:stock_item) { create(:stock_item) }

  describe 'POST #create' do
    let(:valid_params) do
      {
        stock_item_id: stock_item,
        output: attributes_for(:stock_item_operation)
      }
    end

    it 'permitted_params' do
      is_expected.to permit(*%i[amount]).for(:create, params: valid_params).on(:output)
    end
  end
end
