require 'rails_helper'

RSpec.describe Building, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :street }
    it { is_expected.to have_db_column :zip_code }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :country }
  end

  describe 'Associations' do
    it { is_expected.to have_many :bookings }
    it { is_expected.to have_many :timeslots }
    it { is_expected.to have_many :news }
    it { is_expected.to have_many :help_requests }
    it { is_expected.to have_many :facilities }
    it { is_expected.to have_many :users }
    it { is_expected.to have_many :workorders }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:building)).to be_valid
    end
  end
end
