require 'rails_helper'

RSpec.describe WeatherService do
  describe 'class methods' do
    context '.get_weather' do
      it 'returns weather data for a location' do
        city = LocationService.get_coordinates('Denver,CO')
        lat = city[:results][0][:locations][0][:latLng][:lat]
        long = city[:results][0][:locations][0][:latLng][:lng]
        weather = WeatherService.weather(lat, long)
      
        expect(weather).to be_a(Hash)
      end
    end
  end
end