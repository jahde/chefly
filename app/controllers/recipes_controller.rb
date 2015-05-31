class RecipesController < ApplicationController
   skip_before_action :verify_authenticity_token

  def index
    keyword = params[:search_keyword]
    @youtube = Youtube.run("#{keyword} recipe")
    respond_to do |format|
      format.js
    end
  end

  def update
    
    recipe_to_delete = Recipe.find(params[:id])
    if recipe_to_delete.users.include?(current_user)
      current_user.recipes.delete(current_user.recipes.find(params[:id]))
    end

  end

  def create
    # binding.pry
    if Recipe.find_by(directions: params[:directions]) != nil || current_user.recipes.include?(Recipe.find_by(directions: params[:directions]))
     current_user.recipes << Recipe.find_by(directions: params[:directions])
    else
      current_user.recipes << Recipe.create(name: params[:name], directions: params[:directions], category: params[:category], ingredients: params[:ingredients], photo: params[:photo])
    end
    respond_to do |format|
      format.json
    end
  end

  def youtube
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
