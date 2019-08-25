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

ActiveRecord::Schema.define(version: 2019_08_25_000727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", primary_key: "uuid", id: :string, force: :cascade do |t|
    t.string "rfc", null: false
    t.string "ccyisocode", null: false
    t.string "place_generated", null: false
    t.datetime "date", null: false
    t.boolean "vigente", null: false
    t.integer "quantity", null: false
    t.integer "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_id"
    t.string "emisor_rfc"
    t.string "receptor_rfc"
  end

  create_table "businesses", primary_key: "rfc", id: :string, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", primary_key: "product_id", id: :string, force: :cascade do |t|
    t.float "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bills", "businesses", column: "emisor_rfc", primary_key: "rfc"
  add_foreign_key "bills", "businesses", column: "receptor_rfc", primary_key: "rfc"
  add_foreign_key "bills", "products", primary_key: "product_id"
end
