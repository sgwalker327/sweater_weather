class Salary
  attr_reader :id,
              :title,
              :min,
              :max

  def initialize(data)
    @id = nil
    @title = data[:job][:title]
    @min = data[:salary_percentiles][:percentile_25]
    @max = data[:salary_percentiles][:percentile_75]
  end
end