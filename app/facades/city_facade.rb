class CityFacade
  def initialize(city)
    @city = city
  end

  def city_data
    data = TeleportService.salary_data(@city)
    salaries = data[:salaries].map do |salary|
      Salary.new(salary)
    end
  end
end