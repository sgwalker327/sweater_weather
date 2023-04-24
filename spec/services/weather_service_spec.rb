require 'rails_helper'

RSpec.describe WeatherService do
  describe 'class methods' do
    context '.get_weather' do
      it 'returns weather data for a location' do

        weather = WeatherService.get_weather('Denver, CO')
        require 'pry'; binding.pry
        expect(weather).to be_a(Hash)
      end
    end
  end
end