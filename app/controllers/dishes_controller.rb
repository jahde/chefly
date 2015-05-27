class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    #@youtube = Youtube.run(search_words)
  end

end
