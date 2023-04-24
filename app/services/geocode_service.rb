class GeocodeService
  def self.get_coordinates(location)
    get_url("/geocoding/v1/address?location=#{location}")
  end

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