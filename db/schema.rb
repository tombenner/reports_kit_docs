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

ActiveRecord::Schema.define(version: 20170826172945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_airlines_on_code"
  end

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_airports_on_code"
    t.index ["market_id"], name: "index_airports_on_market_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carriers", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_carriers_on_code"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "flight_at"
    t.string "number"
    t.integer "carrier_id"
    t.integer "origin_airport_id"
    t.integer "origin_market_id"
    t.integer "destination_airport_id"
    t.integer "destination_market_id"
    t.integer "delay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_flights_on_carrier_id"
    t.index ["destination_airport_id"], name: "index_flights_on_destination_airport_id"
    t.index ["destination_market_id"], name: "index_flights_on_destination_market_id"
    t.index ["flight_at"], name: "index_flights_on_flight_at"
    t.index ["origin_airport_id"], name: "index_flights_on_origin_airport_id"
    t.index ["origin_market_id"], name: "index_flights_on_origin_market_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_markets_on_code"
  end

  create_table "post_views", force: :cascade do |t|
    t.integer "post_id", null: false
    t.string "browser", null: false
    t.string "operating_system", null: false
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["browser"], name: "index_post_views_on_browser"
    t.index ["location"], name: "index_post_views_on_location"
    t.index ["operating_system"], name: "index_post_views_on_operating_system"
    t.index ["post_id"], name: "index_post_views_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "author_id", null: false
    t.string "title"
    t.string "status", default: "draft", null: false
    t.datetime "published_at"
    t.boolean "is_featured", default: false, null: false
    t.integer "views_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["is_featured"], name: "index_posts_on_is_featured"
    t.index ["published_at"], name: "index_posts_on_published_at"
    t.index ["status"], name: "index_posts_on_status"
    t.index ["views_count"], name: "index_posts_on_views_count"
  end

  create_table "posts_tags", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", unique: true
    t.index ["tag_id"], name: "index_posts_tags_on_tag_id"
  end

  create_table "seed_migration_data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
