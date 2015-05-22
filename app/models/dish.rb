class Dish < ActiveRecord::Base
  has_many :dishes_recipes
  has_many :recipes, through: :dishes_recipes
  belongs_to :restaurant
end
