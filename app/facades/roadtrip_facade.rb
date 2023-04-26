class RoadtripFacade
  def road_trip(origin, destination)
    origin_coords = LocationService.get_coordinates(origin)
    destination_coords = LocationService.get_coordinates(destination)
    require 'pry'; binding.pry
  end
end