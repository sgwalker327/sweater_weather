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
    hash_act_1 = { activity_1[:activity] => {
      type: activity_1[:type],
      participants: activity_1[:participants],
      price: activity_1[:price]
    }
  }
  hash_act_2 = { activity_2[:activity] => {
    type: activity_2[:type],
    participants: activity_2[:participants],
    price: activity_2[:price]
  } }
  activities = hash_act_1.merge(hash_act_2)
    # pre_hashed = [activity_1, activity_2]
    # activities = pre_hashed.flat_map do |activity|
    #            { activity[:activity] => {
    #               type: activity[:type],
    #               participants: activity[:participants],
    #               price: activity[:price]
    #             }
    #           }
    #           end.flatten
    Activity.new(destination, forecast, activities)
  end
end