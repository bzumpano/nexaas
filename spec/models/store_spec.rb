require 'rails_helper'

RSpec.describe Store, type: :model do
  subject(:store) { build(:store) }

  describe 'factories' do
    it { is_expected.to be_valid }
  end

  describe 'db' do
    context 'columns' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
