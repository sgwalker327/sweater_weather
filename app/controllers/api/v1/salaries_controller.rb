class Api::V1::SalariesController < ApplicationController
  def index
    data = CityFacade.new(params[:destination]).city_data
    render json: SalariesSerializer.new(data)
  end
end