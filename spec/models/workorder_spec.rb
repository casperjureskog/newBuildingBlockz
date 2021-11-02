require 'rails_helper'

RSpec.describe Workorder, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :message }
    it { is_expected.to have_db_column :location }
    it { is_expected.to have_db_column :urgent }
    it { is_expected.to have_db_column :status }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :message }
    it { is_expected.to validate_presence_of :location }
  end

  describe 'Associations' do
    it { is_expected.to have_one :help_request }
    it { is_expected.to belong_to :building }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:workorder)).to be_valid
    end
  end
end
