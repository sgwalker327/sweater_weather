require 'rails_helper'

RSpec.describe 'Sessions new request' do
  it 'returns a user\'s api key and email' do
    post "/api/v1/sessions"
    require 'pry'; binding.pry
  end
end