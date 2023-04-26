require 'rails_helper'

RSpec.describe RoadtripFacade do
  describe 'instance methods' do
    context '#road_trip' do
      it 'returns a travel time of impossible when the trip is impossible' do
        origin = 'London,UK'
        destination = 'vail, co'
        trip = RoadtripFacade.new.road_trip(origin, destination)
        expect(trip.travel_time).to eq('impossible')
      end
    end
  end
end