class Restaurant < ActiveRecord::Base
  has_many :dishes


  def self.menu_api(zip_code)
    
    response = HTTParty.get("http://api.locu.com/v1_0/venue/search/?api_key=[API_KEY]&postal_code=#{zip_code}")
      response["objects"].each do |restaurant|
      if (restaurant["has_menu"] == true) && restaurant["categories"].include?("restaurant")
        name = restaurant["name"]
        location = restaurant["street_address"]
        zip = restaurant["postal_code"]
        Restaurant.create(name: name,location: "#{location}, #{zip}")
        menu_id = restaurant["id"]
        menus = HTTParty.get("http://api.locu.com/v1_0/venue/#{menu_id}/?api_key=api_key=[API_KEY]")
      end 
      end

  end
end

