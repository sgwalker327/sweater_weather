require 'rails_helper'

RSpec.describe RoadtripFacade do
  describe 'instance methods' do
    context '#road_trip' do
      it 'returns a roadtrip object with necessary data' do
        origin = 'Vail,CO'
        destination = 'Denver,CO'
        trip = RoadtripFacade.new.road_trip(origin, destination)
        require 'pry'; binding.pry
        expect(trip).to be_a(Roadtrip)
      end
      it 'returns a travel time of impossible when the trip is impossible' do
        origin = 'London,UK'
        destination = 'Vail, CO'
        trip = RoadtripFacade.new.road_trip(origin, destination)
        expect(trip.travel_time).to eq('impossible')
      end
    end
  end
end