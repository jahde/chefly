class Restaurant < ActiveRecord::Base
  has_many :dishes


  def self.menu_api
    response = HTTParty.get('http://api.locu.com/v1_0/venue/search/?api_key=4ce3d82c3063477c85dd0b1926750d78ed9de51d&postal_code=10009')
      binding.pry

  end
end
