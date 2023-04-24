class WeatherService

  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://api.weatherapi.com/v1") do |f|
      f.params['key'] = ENV['WEATHER_API_KEY']
    end
  end
end