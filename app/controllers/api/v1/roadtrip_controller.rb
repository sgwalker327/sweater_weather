class Api::V1::RoadtripController < ApplicationController
  def create
    RoadtripFacade.new(params[:origin], params[:destination])
  end
end