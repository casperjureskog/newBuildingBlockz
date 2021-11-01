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

ActiveRecord::Schema.define(version: 20180607202314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_stats", force: :cascade do |t|
    t.integer  "day"
    t.integer  "week"
    t.string   "setting"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "facility_id"
    t.index ["facility_id"], name: "index_booking_stats_on_facility_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "facility_id"
    t.integer  "building_id"
    t.integer  "user_id"
    t.datetime "end_time"
    t.index ["building_id"], name: "index_bookings_on_building_id", using: :btree
    t.index ["facility_id"], name: "index_bookings_on_facility_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_buildings_on_user_id", using: :btree
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "rules"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "building_id"
    t.string   "dyntime"
    t.string   "bok_day"
    t.string   "bok_dur"
    t.string   "icon"
    t.index ["building_id"], name: "index_facilities_on_building_id", using: :btree
  end

  create_table "help_requests", force: :cascade do |t|
    t.string   "title"
    t.string   "message"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "urgent",       default: false
    t.integer  "workorder_id"
    t.integer  "user_id"
    t.integer  "building_id"
    t.string   "name"
    t.index ["building_id"], name: "index_help_requests_on_building_id", using: :btree
    t.index ["user_id"], name: "index_help_requests_on_user_id", using: :btree
    t.index ["workorder_id"], name: "index_help_requests_on_workorder_id", using: :btree
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "building_id"
    t.index ["building_id"], name: "index_news_on_building_id", using: :btree
  end

  create_table "timelists", force: :cascade do |t|
    t.time     "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "facility_id"
    t.index ["facility_id"], name: "index_timelists_on_facility_id", using: :btree
  end

  create_table "timeslots", force: :cascade do |t|
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "facility_id"
    t.integer  "building_id"
    t.index ["building_id"], name: "index_timeslots_on_building_id", using: :btree
    t.index ["facility_id"], name: "index_timeslots_on_facility_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "provider",               default: "email",  null: false
    t.string   "uid",                    default: "",       null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.json     "tokens"
    t.string   "role",                   default: "tenant"
    t.integer  "building_id"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["building_id"], name: "index_users_on_building_id", using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "workorders", force: :cascade do |t|
    t.string   "title"
    t.string   "message"
    t.string   "location"
    t.boolean  "urgent",          default: false
    t.string   "status",          default: "pending"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "help_request_id"
    t.integer  "building_id"
    t.index ["building_id"], name: "index_workorders_on_building_id", using: :btree
    t.index ["help_request_id"], name: "index_workorders_on_help_request_id", using: :btree
  end

  add_foreign_key "booking_stats", "facilities"
  add_foreign_key "bookings", "buildings"
  add_foreign_key "bookings", "facilities"
  add_foreign_key "bookings", "users"
  add_foreign_key "buildings", "users"
  add_foreign_key "facilities", "buildings"
  add_foreign_key "help_requests", "buildings"
  add_foreign_key "help_requests", "users"
  add_foreign_key "help_requests", "workorders"
  add_foreign_key "news", "buildings"
  add_foreign_key "timelists", "facilities"
  add_foreign_key "timeslots", "buildings"
  add_foreign_key "timeslots", "facilities"
  add_foreign_key "users", "buildings"
  add_foreign_key "workorders", "buildings"
  add_foreign_key "workorders", "help_requests"
end
