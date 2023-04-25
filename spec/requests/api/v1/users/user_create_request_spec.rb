require 'rails_helper'

RSpec.describe 'User API', type: :request do
  it "Post /users" do
    @u1 = User.create!(email: "email@email.com", password: "password", password_confirmation: "password")
    post "/api/v1/users", params: @u1
    require 'pry'; binding.pry
  end
end