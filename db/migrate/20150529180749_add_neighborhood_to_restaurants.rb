class AddNeighborhoodToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :neighborhood, index: true
    add_foreign_key :restaurants, :neighborhoods
  end
end
