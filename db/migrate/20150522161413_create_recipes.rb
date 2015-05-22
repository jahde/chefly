class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients, array: true, default: []
      t.text :directions
      t.string :category

      t.timestamps null: false
    end
  end
end
