require 'rails_helper'

RSpec.describe 'Sessions new request' do
  it 'returns a user\'s api key and email', :vcr do
    @create = { email: "stan@stan.com", 
      password: "password",
      password_confirmation: "password"}
    post '/api/v1/users', params: @create.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    @login = { email: "stan@stan.com", 
      password: "password" }

    post "/api/v1/sessions", params: @login.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
    expect(response).to be_successful
    
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data).to be_a(Hash)
    expect(data[:data].keys).to eq([:id, :type, :attributes])
    expect(data[:data][:attributes].keys).to eq([:email, :api_key])
    expect(data[:data][:attributes].keys).to_not include([:password_digest])
  end
end