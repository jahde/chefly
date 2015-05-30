class Neighborhood < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :restaurants

end
