require 'rails_helper'

RSpec.describe 'Roadtrip create request' do
  describe 'happy path' do
    it 'returns a roadtrip object with necessary data', :vcr do
      u1  = User.create!(email: "sam@sam.com", 
                          password: "password", 
                          password_confirmation: "password",
                          api_key: "jgn983hy48thw9begh98h4539h4")
      body = { origin: 'Vail, CO', destination: 'Denver, CO', api_key: u1.api_key }

      post '/api/v1/road_trip', params: body.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      
      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data[:data]).to be_a(Hash)
      expect(data[:data][:id]).to eq(nil)
      expect(data[:data][:type]).to eq('roadtrip')
      expect(data[:data][:attributes]).to be_a(Hash)
      expect(data[:data][:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])

    end
  end

  describe 'sad path' do
    it 'returns an error if a valid api key is not provided', :vcr do
      body = { origin: 'Vail, CO', destination: 'Denver, CO', api_key: 8 }
      post '/api/v1/road_trip', params: body.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a(Hash)
      expect(error[:error]).to eq('Invalid or Missing API key')
    end
  end  
end