class ActivitiesFacade
  def activities(location)
    coords = LocationService.get_coordinates(location)
    weather = WeatherService.weather(coords[:lat], coords[:long])
    
    destination = "#{weather[:location][:name]}, #{weather[:location][:region]}"
    forecast = {
      summary: weather[:current][:condition][:text],
      temperature: weather[:current][:temp_f]
    }
    require 'pry'; binding.pry
    acttivity1 = ActivitiesService.get_activities
  end
end