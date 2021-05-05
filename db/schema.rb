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

ActiveRecord::Schema.define(version: 2021_05_05_180838) do

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "family_id"
    t.string "gender"
    t.date "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "bored", default: false
    t.string "status"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "playdate_id"
    t.integer "user_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string "family_title"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.float "latitude"
    t.float "longitude"
    t.string "email"
  end

  create_table "family_connections", force: :cascade do |t|
    t.integer "family_id"
    t.integer "famconnect_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "familytags", force: :cascade do |t|
    t.integer "family_id"
    t.integer "tag_id"
    t.integer "importance_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer "child_id"
    t.integer "playdate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playdates", force: :cascade do |t|
    t.string "playdate_title"
    t.string "location"
    t.string "description"
    t.datetime "datetime"
    t.integer "originator"
    t.integer "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "family_id"
    t.integer "famconnect_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.integer "family_id"
    t.boolean "parent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean "omniuser", default: false
  end

end
