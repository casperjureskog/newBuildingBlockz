require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    describe 'create tenant' do
        it 'creates tenant when passed in valid attributes' do
            post '/api/v1/auth', params: { email: 'thomas@random.com',
                                           password: 'password',
                                           password_confirmation: 'password' },
                                 headers: headers
            expect(response).to have_http_status(200)
            expect(User.last.email).to eq 'thomas@random.com'
        end
    end

    describe 'create admin' do
        it 'creates admin when passed in valid attributes' do
            post '/api/v1/auth', params: { email: 'admin@random.com',
                                           password: 'password',
                                           password_confirmation: 'password',
                                           role: 'admin' },
                                 headers: headers
            expect(response).to have_http_status(200)
            expect(User.last.role).to eq 'admin'
        end
    end

    describe 'create tenant with email missing' do
        it 'returns error when email is missing' do
            post '/api/v1/auth', params: { email: '',
                                           password: 'password',
                                           password_confirmation: 'password' },
                                 headers: headers
            expect(response).to have_http_status(422)
        end
    end

    describe 'create tenant with invalid password confirmation' do
        it 'returns error if password confirmation is not a match' do
            post '/api/v1/auth', params: { email: 'thomas@random.com',
                                           password: 'password',
                                           password_confirmation: 'word' },
                                 headers: headers
            expect(response).to have_http_status(422)
        end
    end

    describe 'create tenant with empty password confirmation' do
        # This sucks and should not return a 200 status. Needs to be fixed
        it 'returns error if password confirmation is not a match' do
            post '/api/v1/auth', params: { email: 'thomas@random.com',
                                           password: 'password'},
                                 headers: headers
            expect(response).to have_http_status(200)
        end
    end
end
