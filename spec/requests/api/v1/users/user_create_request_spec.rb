require 'rails_helper'

RSpec.describe 'User API', type: :request do
  describe 'happy path' do
    let(:u1) do 
      { email: "email@email.com", 
            password: "password", 
            password_confirmation: "password" }
      end
    it "POST /users" do
      post "/api/v1/users", params: u1.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      
      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to be_a(Hash)
      expect(user[:data].keys).to include(:id, :type, :attributes)
      expect(user[:data][:attributes].keys).to include(:email, :api_key)
      expect(user[:data][:attributes][:email]).to eq(@u1[:email])
      expect(user[:data][:attributes][:api_key]).to be_a(String)
      expect(user[:data][:attributes][:api_key].length).to eq(32)
    end
  end
end