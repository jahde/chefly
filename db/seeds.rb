# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.data_dump

Neighborhood.create([

  { name: "Central Harlem",
    zipcodes: [10026, 10027, 10030, 10037, 10039],
    image_url: "harlem_central.jpg"
  },

  { name: "Chelsea",
    zipcodes: [10001, 10011, 10018, 10019, 10020, 10036],
    image_url: "chelsea.jpg"
  },

  { name: "East Harlem",
    zipcodes: [10029, 10035],
    image_url: "harlem_east.jpg"
  },

  { name: "Gramercy",
    zipcodes: [10010, 10016, 10017, 10022],
    image_url: "gramercy.jpg"
  },

  { name: "Soho",
    zipcodes: [10012, 10013, 10014],
    image_url: "soho.jpg"
  },

  { name: "Lower Manhattan",
    zipcodes: [10004, 10005, 10006, 10007, 10038, 10280],
    image_url: "lower_manhattan.jpg"
  },

  { name: "Lower East Side",
    zipcodes: [10002, 10003, 10009],
    image_url: "lower_east_side.jpg"
  },

  { name: "Upper East Side",
    zipcodes: [10021, 10028, 10044, 10065, 10075, 10128],
    image_url: "upper_east_side.jpg"
  },

  { name: "Upper West Side",
    zipcodes: [10023, 10024, 10025],
    image_url: "upper_west_side.jpg"
  },

  { name: "Washington Heights",
    zipcodes: [10031, 10032, 10033, 10034, 10040],
    image_url: "washington_heights.jpg"
  }
])
