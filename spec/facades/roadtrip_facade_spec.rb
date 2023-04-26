require 'rails_helper'

RSpec.describe RoadtripFacade do
  describe 'instance methods' do
    context '#road_trip' do
      it 'returns a roadtrip object with necessary data', :vcr do
        origin = 'Vail,CO'
        destination = 'Denver,CO'
        trip = RoadtripFacade.new.road_trip(origin, destination)

        expect(trip).to be_a(Roadtrip)
        expect(trip.end_city).to eq(destination)
        expect(trip.start_city).to eq(origin)
        expect(trip.travel_time).to be_a(String)
        expect(trip.weather_at_eta).to be_a(Hash)
        expect(trip.weather_at_eta[:datetime]).to be_a(String)
        expect(trip.weather_at_eta[:temperature]).to be_a(Float)
        expect(trip.weather_at_eta[:conditions]).to be_a(String)
      end
      it 'returns a travel time of impossible when the trip is impossible', :vcr do
        origin = 'London,UK'
        destination = 'Vail, CO'
        trip = RoadtripFacade.new.road_trip(origin, destination)
        
        expect(trip.travel_time).to eq('impossible')
      end
    end
  end
end