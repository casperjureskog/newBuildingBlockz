require 'rails_helper'

RSpec.describe Api::V1::NewsController, type: :request do
  let!(:news) { create(:news, title: 'Utegångsförbud', description: 'Juan') }
   
  describe 'GET /v1/news' do
    it 'should return all the news titles and description' do
      get '/api/v1/news'

      expected_response = [{
        'id' => news.id, 'title' => 'Utegångsförbud', 'description' => 'Juan', 'date' => news.created_at.strftime('%F %H:%M')
      }]

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end
end
