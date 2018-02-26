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

ActiveRecord::Schema.define(version: 20180225234534) do

  create_table "masscans", force: :cascade do |t|
    t.string "target"
    t.string "rate"
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nmapscans", force: :cascade do |t|
    t.string "filename"
    t.string "target"
    t.string "port"
    t.string "fragment"
    t.string "os"
    t.string "service_version"
    t.string "safe"
    t.string "vuln"
    t.string "speed"
    t.string "ping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
