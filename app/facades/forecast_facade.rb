require 'date'

class ForecastFacade

  def get_forecast(location)
    city = LocationService.get_coordinates(location)
    lat = city[:results][0][:locations][0][:latLng][:lat]
    long = city[:results][0][:locations][0][:latLng][:lng]
    weather = WeatherService.weather(lat, long)

    current_weather = {
      last_updated: weather[:current][:last_updated],
      temperature: weather[:current][:temp_f],
      feels_like: weather[:current][:feelslike_f],
      humidity: weather[:current][:humidity],
      uvi: weather[:current][:uv],
      visibility: weather[:current][:vis_miles],
      condition: weather[:current][:condition][:text],
      icon: weather[:current][:condition][:icon]
    }

    daily_weather = weather[:forecast][:forecastday][0..4].map do |day|
      {
        date: day[:date],
        sunrise: day[:astro][:sunrise],
        sunset: day[:astro][:sunset],
        max_temp: day[:day][:maxtemp_f],
        min_temp: day[:day][:mintemp_f],
        condition: day[:day][:condition][:text],
        icon: day[:day][:condition][:icon]
      }
    end

    hourly_weather = weather[:forecast][:forecastday][0][:hour].map do |hour|
      {
        time: DateTime.parse(hour[:time]).strftime("%H:%M"),
        temperature: hour[:temp_f],
        conditions: hour[:condition][:text],
        icon: hour[:condition][:icon]
      }
    end

    Weather.new(current_weather, daily_weather, hourly_weather)
  end
end