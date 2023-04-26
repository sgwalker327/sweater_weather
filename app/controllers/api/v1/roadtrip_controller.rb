class Api::V1::RoadtripController < ApplicationController
  before_action :validate_api_key
  def create
    if params[:api_key]
    require 'pry'; binding.pry
    trip = RoadtripFacade.new.road_trip(params[:origin], params[:destination])
    else
    end
  end
end