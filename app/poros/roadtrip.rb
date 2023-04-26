class Roadtrip
  attr_reader :start_city,
              :end_city, 
              :travel_time, 
              :weather_at_eta
  
  def initialize(data)
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = data[:travel_time]
    @weather_at_eta = find_weather(data[:weather_at_eta])
  end

  def find_weather(current_weather)
   travel_hours, travel_minutes, travel_seconds = @travel_time.split(":").map(&:to_i)
   eta_time = Time.now + travel_hours.hours + travel_minutes.minutes + travel_seconds.seconds
   round_timestamp = Time.parse(eta_time.to_s).getlocal
   rounded_time = Time.at((round_timestamp.to_f / 3600.0).round * 3600).getlocal
   formatted_time = rounded_time.strftime('%Y-%m-%d %H:%M')
   date_string = rounded_time.strftime('%Y-%m-%d')
   
  eta_weather = []
    current_weather[:forecast][:forecastday].map do |day|
      if day[:date] == date_string
        day[:hour].find do |hour|
          if hour[:time] == formatted_time
            eta_weather << {
              datetime: hour[:time],
              temperature: hour[:temp_f],
              conditions: hour[:condition][:text]
            }
          end
        end
      end
    end
   eta_weather.first
  end
end