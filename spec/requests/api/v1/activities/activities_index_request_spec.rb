require 'rails_helper'

RSpec.describe 'Activities API', type: :request do
  it "GET /api/v1/activities" do
    get "/api/v1/activities?destination=chicago,il"
    require 'pry'; binding.pry
  end
end