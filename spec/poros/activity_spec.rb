require 'rails_helper'

RSpec.describe Activity do
  it 'returns an activity object with attributes' do
    activities = {"Teach your dog a new trick"=>{:type=>"relaxation", :participants=>1, :price=>0.05}, "Clean out your refrigerator"=>{:type=>"busywork", :participants=>1, :price=>0}}
    destination = "Denver, Colorado"
    forecast = {:summary=>"Partly cloudy", :temperature=>53.4}
    activity = Activity.new(destination, forecast, activities)
    
    expect(activity).to be_an_instance_of(Activity)
    expect(activity.destination).to eq("Denver, Colorado")
    expect(activity.activities).to be_a(Hash)
    expect(activity.activities.first[1].keys).to eq([:type, :participants, :price])
    expect(activity.forecast).to be_a(Hash)
    expect(activity.forecast.keys).to eq([:summary, :temperature])
  end
end