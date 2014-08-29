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

ActiveRecord::Schema.define(version: 20140816150410) do

  create_table "activities", force: true do |t|
    t.string   "identifier",               null: false
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.integer  "task_id",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["identifier"], name: "index_activities_on_identifier", unique: true
  add_index "activities", ["task_id"], name: "index_activities_on_task_id"

  create_table "collections", force: true do |t|
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.integer  "harbor_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["harbor_id"], name: "index_collections_on_harbor_id"

  create_table "harbors", force: true do |t|
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "harbors", ["name"], name: "index_harbors_on_name", unique: true

  create_table "mappings", force: true do |t|
    t.integer  "in_id"
    t.integer  "out_id"
    t.integer  "task_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mappings", ["in_id"], name: "index_mappings_on_in_id"
  add_index "mappings", ["out_id"], name: "index_mappings_on_out_id"
  add_index "mappings", ["task_id"], name: "index_mappings_on_task_id"

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "ports", force: true do |t|
    t.integer  "data_type",                   null: false
    t.integer  "port_type",                   null: false
    t.boolean  "is_optional", default: false, null: false
    t.integer  "activity_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ports", ["activity_id"], name: "index_ports_on_activity_id"

  create_table "properties", force: true do |t|
    t.string   "key",                      null: false
    t.string   "description", default: "", null: false
    t.integer  "activity_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["activity_id"], name: "index_properties_on_activity_id"
  add_index "properties", ["key"], name: "index_properties_on_key"

  create_table "regions", force: true do |t|
    t.string   "name",                       null: false
    t.text     "description",   default: "", null: false
    t.integer  "next_id"
    t.integer  "prev_id"
    t.float    "lat",                        null: false
    t.float    "lon",                        null: false
    t.integer  "technology",                 null: false
    t.integer  "accuracy"
    t.string   "identifier"
    t.integer  "minor"
    t.integer  "major"
    t.text     "shape"
    t.integer  "collection_id",              null: false
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["collection_id"], name: "index_regions_on_collection_id"
  add_index "regions", ["identifier"], name: "index_regions_on_identifier"
  add_index "regions", ["lat"], name: "index_regions_on_lat"
  add_index "regions", ["lon"], name: "index_regions_on_lon"
  add_index "regions", ["task_id"], name: "index_regions_on_task_id"

  create_table "task_properties", force: true do |t|
    t.integer  "task_id",    null: false
    t.integer  "region_id",  null: false
    t.string   "key",        null: false
    t.string   "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_properties", ["key"], name: "index_task_properties_on_key"
  add_index "task_properties", ["region_id"], name: "index_task_properties_on_region_id"
  add_index "task_properties", ["task_id"], name: "index_task_properties_on_task_id"

  create_table "tasks", force: true do |t|
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.integer  "harbor_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["harbor_id"], name: "index_tasks_on_harbor_id"

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
