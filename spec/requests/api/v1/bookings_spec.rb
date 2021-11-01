require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  let(:building) { create(:building, name: 'bighouse', street: 'bigstreet')}
  let(:facility) { create(:facility,
    name: 'Sauna',
    description: 'Hot hot Sauna',
    rules: 'No Underwear',
    status: true,
    building_id: building.id)}
  let!(:booking) { create(:booking,
     name: 'Casper',
     start_time: '2017-04-01 12:09',
     facility_id: facility.id,
     building_id: building.id)}

  describe "GET /api/v1/facilities/:facility_id/bookings" do
     it "it should return all bookings, name and date" do
       get api_v1_facility_bookings_path(facility.id)

       expected_response = [{
         'id' => booking.id,
         'name' => 'Casper',
         'start_time' => '2017-04-01T12:09:00.000Z'
       }]

       expect(response_json).to eq expected_response
       expect(response.status).to eq 200
     end
   end

   describe 'POST /v1/facilities/:facility_id/bookings' do
     it 'should collect call for Bookings from mobile client' do
       @user = create(:user, email: "mail1@mail1.com", password: "12345678")

       params = {
         name: 'Nisse',
         start_time: '2017-04-01T12:09:00.000Z',
         building_id: building.id,
         end_time: '2017-04-01T12:11:00.000Z',
         user_id: @user.id
                 }

       post "/api/v1/facilities/#{facility.id}/bookings", params

       expect(response.code).to eq '200'
       object = Booking.find_by(name: 'Nisse', start_time: '2017-04-01T12:09:00.000Z')
       expect(object).to be_persisted
     end
     it 'should render code 400 on failure' do
       post "/api/v1/facilities/#{facility.id}/bookings/"
       expected_response = {message: ["Title can't be blank", "Message can't be blank", "Urgent can't be blank"]}
       expect(response.code).to eq '400'
    end
   end
end
