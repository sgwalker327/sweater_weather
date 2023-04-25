require 'rails_helper'

RSpec.describe ActivitiesService do
  describe 'class methods' do
    it '.get_activities' do
    activities = ActivitiesService.get_activities
    require 'pry'; binding.pry
    end
  end
end