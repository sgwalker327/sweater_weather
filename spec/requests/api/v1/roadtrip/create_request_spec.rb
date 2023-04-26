require 'rails_helper'

RSpec.describe 'Roadtrip create request' do
  it 'returns a roadtrip object with necessary data' do
    post '/api/v1/road_trip'
    require 'pry'; binding.pry
  end
end