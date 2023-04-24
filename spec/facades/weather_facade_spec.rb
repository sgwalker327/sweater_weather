require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'class methods' do
    context '.get_weather' do
      it 'returns weather data for a location' do
        weather = WeatherFacade.new.get_weather('denver')
        require 'pry'; binding.pry
        expect(weather).to be_a(Hash)
      end
    end
  end
end