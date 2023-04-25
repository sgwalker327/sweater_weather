class WeatherService
  
  def self.weather(lat, long)
    get_url("/v1/forecast.json?q=#{lat},#{long}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.weatherapi.com/") do |f|
      f.params['key'] = ENV['WEATHER_API_KEY']
      f.params['days'] = 5
    end
  end
end