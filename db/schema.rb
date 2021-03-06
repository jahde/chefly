# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150531180831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "ingredients",   default: [],              array: true
    t.integer  "restaurant_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree

  create_table "dishes_recipes", id: false, force: :cascade do |t|
    t.integer "dish_id",   null: false
    t.integer "recipe_id", null: false
  end

  add_index "dishes_recipes", ["dish_id", "recipe_id"], name: "index_dishes_recipes_on_dish_id_and_recipe_id", using: :btree

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.string   "zipcodes",   default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "ingredients", default: [],              array: true
    t.text     "directions"
    t.string   "category"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "photo"
  end

  create_table "recipes_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "recipe_id", null: false
  end

  add_index "recipes_users", ["recipe_id", "user_id"], name: "index_recipes_users_on_recipe_id_and_user_id", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "category"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "neighborhood_id"
  end

  add_index "restaurants", ["neighborhood_id"], name: "index_restaurants_on_neighborhood_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "restaurants", "neighborhoods"
end
