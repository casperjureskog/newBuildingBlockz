require 'rails_helper'

RSpec.describe HelpRequest, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :message }
    it { is_expected.to have_db_column :urgent }
    it { is_expected.to have_db_column :name }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :message }
  end

  describe 'Associations' do
    it { is_expected.to have_one :workorder }
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :building }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:help_request)).to be_valid
    end
  end
end
