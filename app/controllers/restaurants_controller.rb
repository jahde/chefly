class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    Restaurant.menu_api

  end
end
