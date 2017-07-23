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

ActiveRecord::Schema.define(version: 20170512052655) do

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

end
