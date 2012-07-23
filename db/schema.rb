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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120723061905) do

  create_table "matches", :force => true do |t|
    t.integer  "homeuser_id"
    t.integer  "awayuser_id"
    t.integer  "homegoals"
    t.integer  "awaygoals"
    t.string   "hometeam"
    t.string   "awayteam"
    t.datetime "datetime"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "minutes"
    t.boolean  "ended"
  end

  create_table "news_items", :force => true do |t|
    t.integer  "news_template_id"
    t.integer  "match_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "news_templates", :force => true do |t|
    t.string   "major"
    t.string   "minor"
    t.text     "detail"
    t.integer  "news_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "teamname"
    t.string   "email"
    t.string   "country"
    t.integer  "age"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "fifa_username"
  end

end
