class Api::V1::ForecastController < ApplicationController
  def index
    weather = ForecastFacade.new.get_forecast(params[:location])
    render json: ForecastSerializer.new(weather)
    # require 'pry'; binding.pry
  end
end