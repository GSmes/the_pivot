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

ActiveRecord::Schema.define(version: 20160820161913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",                     precision: 9, scale: 2
    t.integer  "category_id"
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.string   "image_path"
    t.integer  "status",                                            default: 0
    t.string   "upload_image_file_name"
    t.string   "upload_image_content_type"
    t.integer  "upload_image_file_size"
    t.datetime "upload_image_updated_at"
    t.integer  "venue_id"
    t.string   "slug"
    t.datetime "date",                                              default: '2014-09-18 12:30:59'
    t.text     "supporting_act"
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
    t.index ["venue_id"], name: "index_events_on_venue_id", using: :btree
  end

  create_table "order_events", force: :cascade do |t|
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.integer  "event_id"
    t.index ["event_id"], name: "index_order_events_on_event_id", using: :btree
    t.index ["order_id"], name: "index_order_events_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.text     "password_digest"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "role",               default: 0
    t.string   "screen_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.text     "image_path", default: "http://i.imgur.com/5p6sEsX.jpg"
    t.text     "city"
    t.text     "state"
    t.integer  "capacity"
    t.string   "slug"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_venues_on_user_id", using: :btree
  end

  add_foreign_key "events", "categories"
  add_foreign_key "order_events", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "venues", "users"
end
