class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
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

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:zip_code)
  end

end
