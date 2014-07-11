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

ActiveRecord::Schema.define(version: 20140711125613) do

  create_table "activities", force: true do |t|
    t.string   "identifier",  null: false
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "task_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "harbor_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "harbors", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ports", force: true do |t|
    t.integer  "data_type",                   null: false
    t.integer  "port_type",                   null: false
    t.boolean  "is_optional", default: false
    t.integer  "activity_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "key",         null: false
    t.string   "value",       null: false
    t.integer  "activity_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name",          null: false
    t.text     "description"
    t.integer  "next_id"
    t.integer  "prev_id"
    t.float    "lat",           null: false
    t.float    "lon",           null: false
    t.integer  "technology",    null: false
    t.integer  "accuracy"
    t.string   "identifier"
    t.integer  "minor"
    t.integer  "major"
    t.text     "shape"
    t.integer  "collection_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "region_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
