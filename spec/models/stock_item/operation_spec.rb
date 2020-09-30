require 'rails_helper'

RSpec.describe StockItem::Operation, type: :model do
  subject(:operation) { build(:stock_item_operation) }

  describe 'factories' do
    it { is_expected.to be_valid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:stock_item_id).of_type(:integer) }
      it { is_expected.to have_db_column(:operation_type).of_type(:integer) }
      it { is_expected.to have_db_column(:status).of_type(:integer).with_options(default: :pending) }
      it { is_expected.to have_db_column(:signed_amount).of_type(:integer) }
      it { is_expected.to have_db_column(:amount).of_type(:integer) }
    end

    context 'indexes' do
      it { is_expected.to have_db_index(:stock_item_id) }
    end
  end

  describe 'enums' do
    context 'status' do
      let(:statuses) do
        {
          pending: 0,
          success: 1,
          insufficient_stock: 2
        }
      end

      it { is_expected.to define_enum_for(:status).with_values(statuses) }
    end

    context 'operation_type' do
      let(:operation_types) do
        {
          input: 0,
          output: 1
        }
      end

      it { is_expected.to define_enum_for(:operation_type).with_values(operation_types) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:stock_item) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:stock_item) }
    it { is_expected.to validate_presence_of(:operation_type) }
    it { is_expected.to validate_presence_of(:amount) }

    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  end
end
