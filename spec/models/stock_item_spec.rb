require 'rails_helper'

RSpec.describe StockItem, type: :model do
  subject(:stock_item) { build(:stock_item) }

  describe 'factories' do
    it { is_expected.to be_valid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:product_id).of_type(:integer) }
      it { is_expected.to have_db_column(:store_id).of_type(:integer) }
      it { is_expected.to have_db_column(:amount).of_type(:integer).with_options(default: 0) }
    end

    context 'indexes' do
      it { is_expected.to have_db_index(:product_id) }
      it { is_expected.to have_db_index(:store_id) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:store) }

    it { is_expected.to have_many(:operations) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:product) }
    it { is_expected.to validate_presence_of(:store) }

    it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
end
