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

    context 'call worker' do
      let(:created_input) { StockItem::Operation.input.where(stock_item_id: stock_item).last }

      before { post(:create, params: valid_params) }

      it { expect(StockItems::AddInputWorker).to have_enqueued_sidekiq_job(created_input.id) }
    end
  end
end
