class WeatherFacade

  def get_weather(location)
    city = LocationService.get_coordinates(location)
    lat = city[:results][0][:locations][0][:latLng][:lat]
    long = city[:results][0][:locations][0][:latLng][:lng]
    weather = WeatherService.weather(lat, long)
    require 'pry'; binding.pry
  end
end