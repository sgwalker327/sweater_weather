require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'class methods' do
    context '.get_weather' do
      it 'returns weather data for a location', :vcr do
        weather = ForecastFacade.new.get_forecast('denver')
        
        expect(weather).to be_an_instance_of(Weather)
      end
    end
  end
end