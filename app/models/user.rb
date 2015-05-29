class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes_users
  has_many :recipes, through: :recipes_users

end
