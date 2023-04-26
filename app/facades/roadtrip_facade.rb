class RoadtripFacade
  def road_trip(origin, destination)
    route_data = LocationService.road_trip_data(origin, destination)
      if route_data[:info][:statuscode] == 402
        data = {
          start_city: origin,
          end_city: destination,
          travel_time: "impossible",
          weather_at_eta: "Road trip not possible"
        }
        
          x = Roadtrip.new(data)
      else
        d_coords = LocationService.get_coordinates(destination)
        weather = WeatherService.weather(d_coords[:lat], d_coords[:long])
        data = {
        start_city: origin,
        end_city: destination,
        travel_time: route_data[:route][:formattedTime],
        weather_at_eta: weather
      }
      # require 'pry'; binding.pry
          Roadtrip.new(data)
      end
  end
end
