require 'rails_helper'

RSpec.describe 'Salaries API' do
  it 'sends a list of salaries' do
    get '/api/v1/salaries?destination=denver'
    require 'pry'; binding.pry
    expect(response).to be_successful
  end
end