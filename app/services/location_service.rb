class LocationService
  def self.get_coordinates(location)
    x = get_url("/geocoding/v1/address?location=#{location}")
    {
      lat: x[:results][0][:locations][0][:latLng][:lat],
      long: x[:results][0][:locations][0][:latLng][:lng]
    }
  end

  def self.road_trip_data(origin, destination)
    x = get_url("/directions/v2/route?from=#{origin}&to=#{destination}")
  end

  private

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://www.mapquestapi.com/") do |f|
      f.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end
end