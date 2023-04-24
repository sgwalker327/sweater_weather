require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'class methods' do
    context '.get_coordinates' do
      it 'returns coordinate data for a location' do

        location = GeocodeService.get_coordinates('Denver,CO')
        
        expect(location).to be_a(Hash)
      end
    end
  end
end