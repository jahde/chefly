require 'yaml'

class Restaurant < ActiveRecord::Base
  has_many :dishes
  belongs_to :neighborhood

  attr_accessor :this_restaurant

  BANNED_WORDS = ["bar", "drinks", "beverages", "wine", "beer", "vino", "desserts", "dolci", "tea", "coffee", "artiginali", "sweet wine", "port", "grappa", "madeira"]

  # NEIGHBORHOODS = {
  #   central_harlem: [10026, 10027, 10030, 10037, 10039],
  #   chelsea: [10001, 10011, 10018, 10019, 10020, 10036],
  #   east_harlem: [10029, 10035],
  #   gramercy: [10010, 10016, 10017, 10022],
  #   soho: [10012, 10013, 10014],
  #   lower_manhattan: [10004, 10005, 10006, 10007, 10038, 10280],
  #   lower_east_side: [10002, 10003, 10009],
  #   upper_east_side: [10021, 10028, 10044, 10065, 10075, 10128],
  #   upper_west_side: [10023, 10024, 10025],
  #   washington_heights: [10031, 10032, 10033, 10034, 10040]
  # }

  def self.data_dump
    @neighborhoods = Neighborhood.all
    # NEIGHBORHOODS.each do |hood,value|
    @neighborhoods.each do |neighborhood|
      # value.each do |zip|
      neighborhood.zipcodes.each do |zip|
        response = HTTParty.get("http://api.locu.com/v1_0/venue/search/?api_key=#{ENV['JAHDE2_LOCU']}&postal_code=#{zip}")
        response["objects"].each do |restaurant|
          if (restaurant["has_menu"] == true) && restaurant["categories"].include?("restaurant")
            name = restaurant["name"]
            zip = restaurant["postal_code"]
            neighborhood_id = neighborhood.id
            this_restaurant = Restaurant.create(name: name,location: "#{zip}", neighborhood_id: neighborhood_id)
            menu_id = restaurant["id"]
            this_restaurant.get_dishes(menu_id, this_restaurant)
          end
        end
      end
    end
  end

  def self.find_restaurant(neighborhood)
    # arr = NEIGHBORHOODS[neighborhood.downcase.split(" ").join("_").to_sym]
    # list = []
    # arr.each do |zip|
    #   restaurant = Restaurant.where(location: zip)
    #   list.push(restaurant)
    # end
    # list
    @neighborhoods = Neighborhood.all


    # We want all restaurants that belong to this neighborhood
  end


  def get_dishes(menu_id, this_restaurant)
     menus = HTTParty.get("http://api.locu.com/v1_0/venue/#{menu_id}/?api_key=#{ENV['JAHDE2_LOCU']}")
        dish_name = ""
        description = ""
        menus["objects"].each do |menu|
          menu["menus"].each do |sub_menu|
            if BANNED_WORDS.include?(sub_menu["menu_name"].downcase.strip)
              next
            end
            sub_menu["sections"].each do |sub_sub|
              if BANNED_WORDS.include?(sub_sub["section_name"].downcase.strip)
                    next
                end
              sub_sub["subsections"].each do |sub_sec|
                 if BANNED_WORDS.include?(sub_sec["subsection_name"].downcase.strip)
                    next
                end
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
