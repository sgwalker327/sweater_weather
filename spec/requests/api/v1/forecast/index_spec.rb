require 'rails_helper'

RSpec.describe 'Forecast index spec' do
  it 'returns weather data for a location' do
    location = 'denver,co'
    get "/api/v1/forecast?location=#{location}"
    
    expect(response).to be_successful
    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to be_a(Hash)
    expect(parsed_data[:data].keys).to include(:id, :type, :attributes)
    expect(parsed_data[:data][:id]).to eq(nil)
    expect(parsed_data[:data][:type]).to eq("forecast")
    expect(parsed_data[:data][:attributes].keys).to include(:current_weather, :hourly_weather, :daily_weather)
    expect(parsed_data[:data][:attributes][:current_weather].keys).to include(:last_updated, :temperature, :feels_like, :humidity, :uvi, :visibility, :condition, :icon)
    expect(parsed_data[:data][:attributes][:daily_weather][0].keys).to include(:date, :sunrise, :sunset, :max_temp, :min_temp, :condition, :icon)
    expect(parsed_data[:data][:attributes][:daily_weather].count).to eq(5)
    expect(parsed_data[:data][:attributes][:hourly_weather].count).to eq(24)
    expect(parsed_data[:data][:attributes][:hourly_weather][0].keys).to include(:time, :temperature, :conditions, :icon)
  end

  it 'returns an error when no location present' do
    location = ''
    get "/api/v1/forecast?location=#{location}"

    expect(response.status).to eq(400)

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error.keys).to include(:error)
    expect(error[:error]).to eq('Invalid location')
  end
end