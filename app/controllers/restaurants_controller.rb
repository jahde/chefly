class RestaurantsController < ApplicationController
  def index
    # @restaurants = Restaurant.all
    narrowed_restaurants = []
    Restaurant.all.each do |restaurant|
      if restaurant.dishes.count > 0
          narrowed_restaurants.push(restaurant) 
      end
    end
    @restaurants = narrowed_restaurants
  end

  def create
  end

  def get_zip
    zip = params[:zip_code]
    Restaurant.menu_api(zip)
    narrowed_restaurants = []
    Restaurant.all.each do |restaurant|
      if restaurant.location.include?(zip) 
        narrowed_restaurants.push(restaurant) 
      end
    end
    @restaurants = narrowed_restaurants
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
