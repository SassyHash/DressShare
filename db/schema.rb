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

ActiveRecord::Schema.define(:version => 20130602212216) do

  create_table "body_type_dresses", :force => true do |t|
    t.integer  "body_type_id"
    t.integer  "dress_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "body_type_searches", :force => true do |t|
    t.integer  "body_type_id"
    t.integer  "search_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "body_types", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dresses", :force => true do |t|
    t.integer  "owner_id"
    t.string   "brand"
    t.string   "color"
    t.integer  "size"
    t.text     "notes"
    t.integer  "rent"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.string   "photo3_content_type"
    t.integer  "photo3_file_size"
    t.datetime "photo3_updated_at"
    t.boolean  "rental"
    t.boolean  "sale"
  end

  add_index "dresses", ["owner_id"], :name => "index_dresses_on_owner_id"
  add_index "dresses", ["size"], :name => "index_dresses_on_size"

  create_table "pool_dresses", :force => true do |t|
    t.integer  "dress_id"
    t.integer  "pool_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pool_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pools", :force => true do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rentals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "dress_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "accepted",   :default => false
  end

  add_index "rentals", ["dress_id"], :name => "index_rentals_on_dress_id"
  add_index "rentals", ["user_id"], :name => "index_rentals_on_user_id"

  create_table "sales", :force => true do |t|
    t.integer  "user_id"
    t.integer  "dress_id"
    t.boolean  "accepted",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "town"
    t.string   "state"
    t.string   "domain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "searches", :force => true do |t|
    t.string   "brands"
    t.string   "colors"
    t.integer  "max_rent"
    t.integer  "min_rent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "sizes"
    t.string   "body_types"
    t.boolean  "rental"
    t.boolean  "sale"
  end

  create_table "size_searches", :force => true do |t|
    t.integer  "size"
    t.integer  "search_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "points"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "class_year"
    t.integer  "school_id"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["school_id"], :name => "index_users_on_school_id"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
