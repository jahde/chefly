class Restaurant < ActiveRecord::Base
  has_many :dishes
  attr_accessor :this_restaurant


  def self.menu_api(zip_code)
    
    response = HTTParty.get("http://api.locu.com/v1_0/venue/search/?api_key=API_KEY&postal_code=#{zip_code}")
      response["objects"].each do |restaurant|
        if (restaurant["has_menu"] == true) && restaurant["categories"].include?("restaurant")
          name = restaurant["name"]
          location = restaurant["street_address"]
          zip = restaurant["postal_code"]
          this_restaurant = Restaurant.create(name: name,location: "#{location}, #{zip}")
          menu_id = restaurant["id"]
          this_restaurant.get_dishes(menu_id, this_restaurant)
        #menus["objects"][0]["menus"][0]["sections"][0]["subsections"][0]["contents"][0]["name"]
      end 
      end

  end


  def get_dishes(menu_id, this_restaurant)
     menus = HTTParty.get("http://api.locu.com/v1_0/venue/#{menu_id}/?api_key=API_KEY")
        dish_name = ""
        description = ""
        menus["objects"].each do |menu|
          menu["menus"].each do |sub_menu|
            sub_menu["sections"].each do |sub_sub|
              sub_sub["subsections"].each do |sub_sec|
                sub_sec["contents"].each do |content|
                  dish_name = content["name"]
                  description = content["description"]
                  Dish.create(name: dish_name, description: description, restaurant_id: this_restaurant.id)
                end
              end
            end
          end
        end

  end
end

