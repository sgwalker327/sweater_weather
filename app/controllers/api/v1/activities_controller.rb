class Api::V1::ActivitiesController < ApplicationController
  def index
    if params[:destination].present?
      info = ActivitiesFacade.new.activities(params[:destination])
      render json: ActivitiesSerializer.new(info)
    else
      render json: { error: 'Invalid location' }, status: :bad_request
    end
  end
end