class RecipesController < ApplicationController
   skip_before_action :verify_authenticity_token

  def index
    keyword = params[:search_keyword]
    @youtube = Youtube.run("#{keyword} recipe")
    respond_to do |format|
      format.js
    end
  end

  def create
    if Recipe.find_by(directions: params[:directions]) != nil || current_user.recipes.include?(Recipe.find_by(directions: params[:directions]))
     current_user.recipes << Recipe.find_by(description: params[:description])
    else
      current_user.recipes << Recipe.create(name: params[:name], directions: params[:directions], category: params[:category])
    end
  end

  def youtube
    binding.pry
    keyword = params[:search_keyword]
    @youtube = Youtube.run("#{keyword} recipe")

    respond_to do |format|
      format.js
    end
  end

  def favorites
    @favorites = current_user.recipes.all
    render 'favorites'
  end

end
