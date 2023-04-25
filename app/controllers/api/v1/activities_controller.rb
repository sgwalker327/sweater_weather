class Api::V1::ActivitiesController < ApplicationController
  def index
    info = ActivitiesFacade.new.activities(params[:destination])
    render json: ActivitiesSerializer.new(info)
  end
end