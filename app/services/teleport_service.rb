class TeleportService

  def self.salary_data(location)
    get_url("/api/urban_areas/slug:#{location}/salaries/")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.teleport.org/")
  end
end
