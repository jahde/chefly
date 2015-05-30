class NeighborhoodsController < ApplicationController

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @restaurants = Restaurant.where(neighborhood_id: params[:id])
  end

end
