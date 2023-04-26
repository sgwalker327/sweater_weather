class RoadtripFacade
  def road_trip(origin, destination)
    route_data = LocationService.road_trip_data(origin, destination)
    if route_data[:info][:statuscode] = 402
      data = {
        start_city: origin,
        end_city: destination,
        travel_time: "impossible",
        weather_at_eta: "Road trip not possible"
      }
      x = Roadtrip.new(data)
    else
      origin_coords = LocationService.get_coordinates(origin)
      destination_coords = LocationService.get_coordinates(destination)
      
    end

    
  end
end