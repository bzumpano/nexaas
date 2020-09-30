require 'rails_helper'

RSpec.describe StockItems::InputsController, type: :controller do
  let(:stock_item) { create(:stock_item) }

  describe 'POST #create' do
    let(:valid_params) do
      {
        stock_item_id: stock_item,
        input: attributes_for(:stock_item_operation)
      }
    end

    it 'permitted_params' do
      is_expected.to permit(*%i[amount]).for(:create, params: valid_params).on(:input)
    end
  end
end
