require 'rails_helper'

RSpec.describe Api::V1::NewsController, type: :request do
  let!(:news) { create(:building, name: 'Main_building') }

  describe 'GET /v1/building' do
    it 'should return the current building' do
      get '/api/v1/buildings'

      expected_response = {
        'id' => news.id, 'name' => 'Main_building', 'count' => 0
      }

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end
end
