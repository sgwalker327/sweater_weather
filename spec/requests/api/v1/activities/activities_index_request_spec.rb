require 'rails_helper'

RSpec.describe 'Activities API', type: :request do
  it "GET /api/v1/activities" do
    get "/api/v1/activities?destination=chicago,il"
    
    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to be_a(Hash)
  end

  it 'returns an error when no location present' do
    location = ''
    get "/api/v1/activities?destination=#{location}"

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error.keys).to include(:error)
    expect(error[:error]).to eq('Invalid location')
  end
end