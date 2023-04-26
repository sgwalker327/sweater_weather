class Api::V1::ForecastController < ApplicationController
  before_action :validate_api_key
  
  def index
    if params[:location].present?
      weather = ForecastFacade.new.get_forecast(params[:location])
      render json: ForecastSerializer.new(weather)
    else
      render json: { error: 'Invalid location' }, status: :bad_request
    end
  end
end