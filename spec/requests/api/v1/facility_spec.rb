require 'rails_helper'

RSpec.describe Api::V1::FacilitiesController, type: :request do
  let(:building) { create(:building, name: 'bighouse', street: 'bigstreet')}
  let!(:facility) { create(:facility,
    name: 'Sauna',
    description: 'Hot hot Sauna',
    rules: 'No windows',
    status: true,
    building_id: building.id)}

  describe 'GET /v1/facilities' do
    it 'should return all the facilities name, description, rules and status' do
      get '/api/v1/facilities'

      expected_response = [{
        'id' => facility.id,
        'name' => 'Sauna',
        'description' => 'Hot hot Sauna',
        'rules' => 'No windows',
        'status' => true,
        'bok_dur' => nil,
        "icon"=>nil
        }]

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end

  describe 'GET /v1/facilities' do
    it 'should return one facility name, description, rules' do
      get "/api/v1/facilities/#{facility.id}"

      expected_response = {
        'name' => 'Sauna',
        'id' => facility.id,
        'description' => 'Hot hot Sauna',
        'rules' => 'No windows',
        'bok_dur' => nil, 'dyntime' => nil, 'count' => 0, 'min' => 'min'
        }

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end

    it 'should render error message on failure' do
      get '/api/v1/facilities/999999'
      expected_response = {message: "Couldn't find Facility with 'id'=999999"}
      expect(response_json).to eq JSON.parse(expected_response.to_json)
      expect(response.status).to eq 404
   end
  end
end
