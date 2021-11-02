require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :building }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:news)).to be_valid
    end
  end
end
