require 'rails_helper'

RSpec.describe Facility, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :rules }
    it { is_expected.to have_db_column :bok_dur }
    it { is_expected.to have_db_column :dyntime }
    it { is_expected.to have_db_column :bok_day }
    it { is_expected.to have_db_column(:status).of_type(:boolean) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
  end

  describe 'Associations' do
    it { is_expected.to have_many :bookings }
    it { is_expected.to have_many :timeslots }
    it { is_expected.to have_many :timelists }
    it { is_expected.to belong_to :building }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:facility)).to be_valid
    end
  end
end
