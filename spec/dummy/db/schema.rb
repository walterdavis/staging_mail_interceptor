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

ActiveRecord::Schema.define(version: 3) do

  create_table "scoops", force: :cascade do |t|
    t.string "flavor"
    t.boolean "has_sprinkles"
    t.boolean "has_caramel"
    t.date "date_scooped"
    t.datetime "datetime_scooped"
    t.date "date_eaten"
    t.datetime "datetime_eaten"
    t.date "date_frozen"
    t.datetime "datetime_frozen"
  end

end
