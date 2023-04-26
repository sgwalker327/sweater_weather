require 'rails_helper'

RSpec.describe 'Roadtrip create request' do
  describe 'happy path' do
    it 'returns a roadtrip object with necessary data' do
      u1  = User.create!(email: "email@email.com", 
                          password: "password", 
                          password_confirmation: "password")
      body = { origin: 'Vail, CO', destination: 'Denver, CO', api_key: u1.api_key }

      post '/api/v1/road_trip', params: body.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      require 'pry'; binding.pry
      expect(response).to be_successful
    end
  end

  describe 'sad path' do
    it 'returns an error if a valid api key is not provided' do
      body = { origin: 'Vail, CO', destination: 'Denver, CO', api_key: 8 }
      post '/api/v1/road_trip', params: body.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a(Hash)
      expect(error[:error]).to eq('Invalid API key')
    end
  end  
end