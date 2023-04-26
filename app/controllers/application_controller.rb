class ApplicationController < ActionController::API

  def validate_api_key
    user = User.find_by(api_key: params[:api_key])
    unless user
      render json: { error: "Invalid or Missing API key" }, status: :unauthorized
    end
  end
end
