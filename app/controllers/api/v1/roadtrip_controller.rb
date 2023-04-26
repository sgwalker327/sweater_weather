class Api::V1::RoadtripController < ApplicationController
  before_action :validate_api_key

  def create
    trip = RoadtripFacade.new.road_trip(params[:origin], params[:destination])
    render json: RoadtripSerializer.new(trip)
    

  end
end