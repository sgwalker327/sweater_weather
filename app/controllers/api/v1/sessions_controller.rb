class Api::V1::SessionsController < ApplicationController
  def new
    # request_body = request.body.read
    # info = JSON.parse(request_body, symbolize_names: true)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    elsif user != nil
      render json: { error: 'Incorrect credentials' }, status: 404
    else 
      render json: { error: 'User not found'}, status: 404
    end
  end
end