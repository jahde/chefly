class RecipesController < ApplicationController

  def index
    keyword = params[:search_keyword]
    @youtube = Youtube.run("#{keyword} recipe")
    respond_to do |format|
      format.js
    end
  end

end
