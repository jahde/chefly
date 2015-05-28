class RecipesController < ApplicationController

  def index
    #binding.pry
    keyword = params[:search_keyword]
    @youtube = Youtube.run("#{keyword} recipe")
    respond_to do |format|
      format.js
    end
  end

  def create
    binding.pry
    Recipe.create(name: params[:name], directions: params[:directions], category: params[:category])
  end

end
