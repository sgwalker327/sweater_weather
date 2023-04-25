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
    expect(parsed_data[:data][:attributes][:current_weather].keys).to_not include(:last_updated_epoch, :temp_c, :wind_mph, :wind_kph, :wind_degree, :wind_dir, :pressure_mb, :pressure_in, :precip_mm, :precip_in, :feelslike_c, :vis_km, :gust_mph, :gust_kph)
    expect(parsed_data[:data][:attributes][:daily_weather].count).to eq(5)
    expect(parsed_data[:data][:attributes][:daily_weather][0].keys).to include(:date, :sunrise, :sunset, :max_temp, :min_temp, :condition, :icon)
    expect(parsed_data[:data][:attributes][:daily_weather][0].keys).to_not include(:maxtemp_c, :mintemp_c, :avgtemp_c, :avgtemp_f, :maxwind_mph, :maxwind_kph, :totalprecip_mm, :totalprecip_in, :totalsnow_cm, :avgvis_km, :avgvis_miles, :avghumidity, :daily_will_it_rain, :daily_chance_of_rain, :daily_will_it_snow, :daily_chance_of_snow, :uv)
    expect(parsed_data[:data][:attributes][:hourly_weather].count).to eq(24)
    expect(parsed_data[:data][:attributes][:hourly_weather][0].keys).to include(:time, :temperature, :conditions, :icon)
    expect(parsed_data[:data][:attributes][:hourly_weather][0].keys).to_not include(:temp_c, :is_day, :wind_mph, :wind_kph, :wind_degree, :wind_dir, :pressure_mb, :pressure_in, :precip_mm, :precip_in, :humidity, :cloud, :feelslike_c, :feelslike_f, :windchill_c, :windchill_f, :heatindex_c, :heatindex_f, :dewpoint_c, :dewpoint_f, :will_it_rain, :chance_of_rain, :will_it_snow, :chance_of_snow, :vis_km, :gust_mph, :gust_kph, :uv)
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