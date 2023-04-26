class RoadtripFacade
  def road_trip(origin, destination)
    origin_coords = LocationService.get_coordinates(origin)
    destination_coords = LocationService.get_coordinates(destination)

    { origin: origin_coords, destination: destination_coords }
  end

  def trip_forecast(origin, destination)
    coords = trip_coordinates(origin, destination)
    weather = WeatherService.weather(coords[:destination][:lat], coords[:destination][:long])
    current_weather = {
      temperature: weather[:current][:temp_f],
      conditions: weather[:current][:condition][:text],
      icon: weather[:current][:condition][:icon]
    }
    { origin: current_weather }
  end
end