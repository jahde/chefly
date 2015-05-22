class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.string :ingredients, array: true, default: []
      t.belongs_to :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :dishes, :restaurants
  end
end
