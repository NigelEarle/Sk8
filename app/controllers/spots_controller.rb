class SpotsController < ApplicationController

  def index
    if params[:search].present?
      @spots = Spot.near(params[:search], 50, :order => :distance)
    else
      @spots = Spot.all
    end
  end

  def new
  end

  def show
    @spot = Spot.find(params[:id])
    # binding.pry
  end

  def create
    @spot = Spot.new(spot_params)

    if @spot.save
      redirect_to spots_url

    else
      render text:"Missed a field..."
    end

  end



private

  def spot_params
    params.require(:spot).permit(:name, :description, :address, :best_time, :days, :rating)
  end

end


