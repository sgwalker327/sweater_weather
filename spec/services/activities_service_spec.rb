require 'rails_helper'

RSpec.describe ActivitiesService do
  describe 'class methods' do
    it '.get_activities' do
    activities = ActivitiesService.get_activities('relaxation')
    
    expect(activities).to be_a(Hash)
    expect(activities.keys).to eq([:activity, :type, :participants, :price, :link, :key, :accessibility])
    end
  end
end