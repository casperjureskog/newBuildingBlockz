require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :start_time }
    it { is_expected.to have_db_column :end_time }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :facility }
    it { is_expected.to belong_to :building }
    it { is_expected.to belong_to :user }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:booking)).to be_valid
    end
  end
end
