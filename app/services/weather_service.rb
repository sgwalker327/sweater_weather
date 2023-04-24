class WeatherService
  def initialize(location)
    @location = location
  end
  
  def self.get_weather(location)
    get_url("/v1/forecast.json?query=#{location}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.weatherapi.com/") do |f|
      f.params['key'] = ENV['WEATHER_API_KEY']
      # f.params['q'] = @location
    end
  end
end