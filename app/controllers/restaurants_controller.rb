class RestaurantsController < ApplicationController
  # def index
  #   narrowed_restaurants = []
  #   Restaurant.all.each do |restaurant|
  #     if restaurant.dishes.count > 0
  #         narrowed_restaurants.push(restaurant)
  #     end
  #   end
  #   @restaurants = narrowed_restaurants
  # end

  def create
  end

  def index
    neighborhood = params[:neighborhood]
    @restaurants = Restaurant.find_restaurant(neighborhood).flatten
    render 'index'
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurants).permit(:name, :location, :category)
  end

end
