class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    # @dish = Dish.find(name: )
  end

end
