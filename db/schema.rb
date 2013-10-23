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

ActiveRecord::Schema.define(:version => 20131009084354) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendlists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "friend_staus"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "friend_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "imagable_type"
    t.integer  "imagable_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "image"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.text     "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.string   "ratingable_type"
    t.integer  "ratingable_id"
    t.boolean  "like"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "contact"
    t.string   "hobby"
    t.string   "home_town"
    t.string   "state"
    t.string   "country"
    t.boolean  "relationship_status"
    t.string   "interest_in"
    t.string   "language"
    t.string   "religion"
    t.boolean  "gender"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
