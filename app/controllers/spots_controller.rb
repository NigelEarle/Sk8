class SpotsController < ApplicationController

  def index
    if params[:search].present?
      @spots = Spot.near(params[:search], 50, :order => :distance)
    else
      @spots = Spot.all
    end
  end

  def something
  end

end