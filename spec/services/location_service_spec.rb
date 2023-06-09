require 'rails_helper'

RSpec.describe LocationService do
  describe 'class methods' do
    context '.get_coordinates' do
      it 'returns coordinate data for a location', :vcr do
        location = LocationService.get_coordinates('Denver,CO')
        
        expect(location).to be_a(Hash)
        expect(location.keys).to include(:lat, :long)
      end
    end

    context '.get_time' do
      it 'returns time data for a trip', :vcr do
        data = LocationService.road_trip_data('Denver,CO', 'Vail, CO')
        
        expect(data).to be_a(Hash)
      end
    end
  end
end