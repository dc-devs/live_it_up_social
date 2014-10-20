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

ActiveRecord::Schema.define(version: 20141020062804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "location"
    t.string   "category"
    t.string   "icon"
    t.string   "photo"
    t.text     "necessities"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "date",        default: "Saturday"
    t.string   "start_time",  default: "10:00 am"
    t.string   "duration",    default: "6 hours + drinking overtime"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "motto"
    t.string   "photo"
    t.string   "professional_blurb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "phone_number"
    t.integer  "remaining_votes",    default: 5
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "vote_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
