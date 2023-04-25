require 'rails_helper'

RSpec.describe ActivitiesFacade do
  describe 'instance methods' do
    it '#activities' do
      activities = ActivitiesFacade.new.activities('denver,co')

      expect(activities).to be_an_instance_of(Activity)
      expect(activities.destination).to eq('Denver, Colorado')
      expect(activities.activities).to be_a(Hash)
      expect(activities.activities.first[1].keys).to eq([:type, :participants, :price])
      expect(activities.forecast).to be_a(Hash)
      expect(activities.forecast.keys).to eq([:summary, :temperature])
    end
  end
end