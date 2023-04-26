require 'rails_helper'

RSpec.describe 'Roadtrip create request' do
  it 'returns a roadtrip object with necessary data' do
    locations = { origin: 'London,UK', destination: 'vail, co' }

    post '/api/v1/road_trip', params: locations
    require 'pry'; binding.pry
  end
end