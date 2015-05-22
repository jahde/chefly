class Restaurant < ActiveRecord::Base
  has_many :dishes


  def self.menu_api
    
    response = HTTParty.get("http://api.locu.com/v1_0/venue/search/?api_key=ENV[API_KEY]&postal_code=10009&has_menu=true")
      response["objects"].each do |restaurant|
      if (restaurant["has_menu"] == true) && restaurant["categories"].include?("restaurant")
        name = restaurant["name"]
        location = restaurant["street_address"]
        Restaurant.create(name: name,location: location)
        menu_id = restaurant["id"]
        menus = HTTParty.get("http://api.locu.com/v1_0/venue/#{menu_id}/?api_key=ENV[API_KEY]")
      end 
      end

  end
end

