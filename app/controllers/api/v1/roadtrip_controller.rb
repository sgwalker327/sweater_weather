class Api::V1::RoadtripController < ApplicationController
  def create
    RoadtripFacade.new.road_trip(params[:origin], params[:destination])
  end
end