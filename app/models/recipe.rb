class Recipe < ActiveRecord::Base
  has_many :dishes_recipes
  has_many :dishes, through: :dishes_recipes

  include RecipesHelper
end


