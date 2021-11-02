require 'rails_helper'

RSpec.describe Api::V1::HelpRequestsController, type: :request do

  describe 'POST /v1/help_requests' do
    it 'should collect call for help message from mobile client' do
      @user = create(:user, email: "mail@mail.com", password: "12345678")
      login_as @user
      building = create(:building, name: 'bighouse', street: 'bigstreet')

      params = {
        title: 'Burning',
        message: 'Pants is burning',
        urgent: true,
        building_id: building.id
                }

      post '/api/v1/help_requests', params

      expect(response.code).to eq '200'
      object = HelpRequest.find_by(title: 'Burning', message: 'Pants is burning', urgent: true, building_id: building.id)
      expect(object).to be_persisted
    end
    it 'should render code 400 on failure' do
      post '/api/v1/help_requests'
      expected_response = {message: ["Title can't be blank", "Message can't be blank", "Urgent can't be blank"]}
      expect(response.code).to eq '400'
   end
  end
end
