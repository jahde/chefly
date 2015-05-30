class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :image_url
      t.string :zipcodes, array: true, default: []
      t.timestamps null: false
    end
  end
end
