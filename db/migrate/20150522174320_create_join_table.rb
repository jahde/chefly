class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :dishes, :recipes do |t|
       t.index [:dish_id, :recipe_id]
    end
  end
end
