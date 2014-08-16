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

ActiveRecord::Schema.define(version: 20140816073112) do

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

  create_table "mappings", force: true do |t|
    t.integer  "in_id"
    t.integer  "out_id"
    t.integer  "task_id",    null: false
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
    t.string   "description"
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
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_properties", force: true do |t|
    t.integer  "task_id"
    t.integer  "region_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "harbor_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 0,  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
