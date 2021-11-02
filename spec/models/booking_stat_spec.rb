require 'rails_helper'

RSpec.describe BookingStat, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :day }
    it { is_expected.to have_db_column :week }
    it { is_expected.to have_db_column :setting }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :facility }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:booking)).to be_valid
    end
  end
end
