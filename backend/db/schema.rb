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

ActiveRecord::Schema.define(version: 2021_07_12_161008) do

  create_table "beverages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "img_url"
  end

  create_table "components", force: :cascade do |t|
    t.integer "beverage_id"
    t.integer "ingredient_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beverage_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ingredient_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.string "title"
    t.float "rating"
    t.integer "beverage_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.text "bio"
    t.string "avatar"
    t.string "password"
  end

end
