class ActivitiesFacade
  def activities(location)
    coords = LocationService.get_coordinates(location)
    weather = WeatherService.weather(coords[:lat], coords[:long])
    
    destination = "#{weather[:location][:name]}, #{weather[:location][:region]}"
    forecast = {
      summary: weather[:current][:condition][:text],
      temperature: weather[:current][:temp_f]
    }
    activity_1 = ActivitiesService.get_activities('relaxation')
    activity_2 = (
      if weather[:current][:temp_f] < 60 && weather[:current][:temp_f] >= 50
        ActivitiesService.get_activities('busywork')
      elsif weather[:current][:temp_f] >= 60
        ActivitiesService.get_activities('relaxation')
      else
        ActivitiesService.get_activities('cooking')
      end
    )
    activities = [activity_1, activity_2]
    hashed = activities.map do |activity|
                [:activity] {
                  type: activity[:type],
                  participants: activity[:participants],
                  price: activity[:price]
                }
              end
    require 'pry'; binding.pry
  end
end