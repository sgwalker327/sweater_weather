class ActivitiesFacade
  def activities(location)
    coords = LocationService.get_coordinates(location)
    weather = WeatherService.weather(coords[:lat], coords[:long])
    activities = ActivitiesService.get_activities

    forecast = {
      
    }
  end
end