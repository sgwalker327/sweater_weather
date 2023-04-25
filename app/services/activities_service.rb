class ActivitiesService
  def self.get_activities(type)
    get_url("?type=#{type}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://www.boredapi.com/api/activity/")
  end
end