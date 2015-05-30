class HomeController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all

    narrowed_restaurants = []
    Restaurant.all.each do |restaurant|
      if restaurant.dishes.count > 0
          narrowed_restaurants.push(restaurant)
      end
    end
    @restaurants = narrowed_restaurants
  end

end
