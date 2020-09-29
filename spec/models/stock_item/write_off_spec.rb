require 'rails_helper'

RSpec.describe StockItem::WriteOff, type: :model do
  subject(:write_off) { build(:write_off) }

  describe 'factories' do
    it { is_expected.to be_valid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:stock_item_id).of_type(:integer) } }
      it { is_expected.to have_db_column(:amount).of_type(:integer) }
    end

    context 'indexes' do
      it { is_expected.to have_db_index(:stock_item_id) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:stock_item) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:stock_item) }
    it { is_expected.to validate_presence_of(:amount) }
  end
end
