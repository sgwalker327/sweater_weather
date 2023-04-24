class CityFacade
  def initialize(city)
    @city = city
  end

  def city_data
    data = TeleportService.salary_data(@city)
    require 'pry'; binding.pry
  end
end