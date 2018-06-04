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

ActiveRecord::Schema.define(version: 2018_06_04_142727) do

  create_table "expences", force: :cascade do |t|
    t.integer "timecard_id"
    t.integer "expence_kbn", default: 0, null: false
    t.date "date", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cost", default: 0, null: false
    t.index ["timecard_id"], name: "index_expences_on_timecard_id"
  end

  create_table "generics", force: :cascade do |t|
    t.string "kbn", null: false
    t.integer "key1", null: false
    t.string "data1", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kbn", "key1"], name: "index_generics_on_kbn_and_key1", unique: true
  end

  create_table "timecard_details", force: :cascade do |t|
    t.integer "timecard_id", null: false
    t.date "target_date"
    t.integer "kinmu_jokyo", default: 0
    t.time "start_time", default: "2000-01-01 09:00:00"
    t.time "end_time", default: "2000-01-01 18:00:00"
    t.integer "break_time", default: 60
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timecard_id"], name: "index_timecard_details_on_timecard_id"
  end

  create_table "timecard_indeces", force: :cascade do |t|
    t.string "target_month", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timecards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "target_month", null: false
    t.integer "shinsei_kbn", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "keihi_shinsei_kbn", default: 0, null: false
    t.index ["user_id", "target_month"], name: "index_timecards_on_user_id_and_target_month", unique: true
    t.index ["user_id"], name: "index_timecards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
