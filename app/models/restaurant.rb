class Restaurant < ActiveRecord::Base
  has_many :dishes


  def menu_api

  end
end

curl -X POST https://api.locu.com/v2/venue/search -d '{
 "api_key" : "52894784aaa87819f3d54cf326d531ba814b412d",
 "fields" : [ "name", "location", "contact" ],
 "venue_queries" : [
   {
     "name" : "bistro central parc"
   }
 ]
}'