require 'rails_helper'

RSpec.describe LocationService do
  describe 'class methods' do
    context '.get_coordinates' do
      it 'returns coordinate data for a location' do

        location = LocationService.get_coordinates('Denver,CO')
      #  require 'pry'; binding.pry
        expect(location).to be_a(Hash)
        expect(location.keys).to include(:info, :options, :results)
      end
    end
  end
end