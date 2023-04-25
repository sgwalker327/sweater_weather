require 'rails_helper'

RSpec.describe ActivitiesFacade do
  describe 'instance methods' do
    it '#activities' do
      activities = ActivitiesFacade.new.activities('denver,co')

      expect(activities).to be_an_instance_of(Array)
      expect(activities.first).to be_an_instance_of(Activity)
    end
  end
end