class Recipe < ActiveRecord::Base
  has_many :dishes_recipes
  has_many :dishes, through: :dishes_recipes
  has_many :recipes_users
  has_many :users, through: :recipes_users


end


