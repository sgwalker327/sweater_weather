require 'rails_helper'

RSpec.describe WeatherService do
  describe 'class methods' do
    context '.weather' do
      it 'returns weather data for a location', :vcr do
        city = LocationService.get_coordinates('Denver,CO')
        
        weather = WeatherService.weather(city[:lat], city[:long])
      
        expect(weather).to be_a(Hash)
      end
    end
  end
end