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


ActiveRecord::Schema.define(version: 20181223050059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploaded_transactions", force: :cascade do |t|
    t.text "address"
    t.text "city"
    t.text "state"
    t.text "zip"
    t.date "listing_date"
    t.bigint "listing_price"
    t.bigint "listing_agent_id"
    t.date "selling_date"
    t.bigint "selling_price"
    t.bigint "selling_agent_id"
    t.text "status"
    t.text "property_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["listing_agent_id"], name: "idx_49269_index_uploaded_transactions_on_listing_agent_id"
    t.index ["selling_agent_id"], name: "idx_49269_index_uploaded_transactions_on_selling_agent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  end

end
