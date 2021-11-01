require 'rails_helper'

RSpec.describe "Timeslots", type: :request do
  let(:facility) { create(:facility,
    name: 'Sauna',
    description: 'Hot hot Sauna',
    rules: 'No Underwear',
    status: true)}

  let!(:timeslot) { create(:timeslot,
     start_time: '12:00',
     end_time: '16:00',
     facility_id: facility.id)}

  describe "GET /api/v1/facilities/:facility_id/timeslots" do
    it "it should return all time slots for Sauna" do

      params = {
        date: '2017-05-03T22:00:00.000Z',
                }

      get api_v1_facility_timeslots_path(facility.id) , params

      expected_response = [{
       'start_time' => '12:00',
       'end_time' => '16:00'
      }]

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end

    it 'should render error message on failure' do
      get '/api/v1/facilities/9999999/timeslots'
      expected_response = {message: "Couldn't find Facility with 'id'=9999999"}
      expect(response_json).to eq JSON.parse(expected_response.to_json)
      expect(response.status).to eq 404
   end
  end
end
