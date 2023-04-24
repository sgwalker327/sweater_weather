require 'rails_helper'

RSpec.describe 'Forecast index spec' do
  it 'returns weather data for a location' do
    location = 'denver,co'
    get "/api/v1/forecast?location=#{location}"
    
    expect(response).to be_successful
  end
end