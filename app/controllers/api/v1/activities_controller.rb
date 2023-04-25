class Api::V1::ActivitiesController < ApplicationController
  def index
    x = ActivitiesFacade.new.activities(params[:destination])
    require 'pry'; binding.pry
  end
end